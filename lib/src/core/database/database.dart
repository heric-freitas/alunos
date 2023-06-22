import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../helper/helper_database/helper_database.dart';

class DatabaseSqfLite {
  static DatabaseSqfLite? _instance;
  late Database database;

  DatabaseSqfLite._();

  static DatabaseSqfLite get instance {
    _instance ??= DatabaseSqfLite._();
    return _instance!;
  }

  Future<void> openConnection() async {
    final databasePath = await getDatabasesPath();
    final databasePathAlunos = join(databasePath, 'ALUNOS');

    database = await openDatabase(
      databasePathAlunos,
      version: 1,
      onCreate: (db, version) {
        log('Create');
        var batch = db.batch();

        batch.execute('''
create table alunos(
  id Integer primary key autoincrement,
  name varchar(200),
  email varchar(200),
  monthly_payment varchar(15),
  phone varchar(13),
  situation Integer,
  observation varchar(200)
)
 ''');

        batch.commit();
      },
      onUpgrade: (db, oldVersion, newVersion) {},
      onDowngrade: (db, oldVersion, newVersion) {},
    );
  }

  //CREATE
  Future<void> insertStudents({
    required String name,
    required String email,
    required String phone,
    required bool situation,
    required String observation,
    required String monthlyPayment
  }) async {
    await database.rawInsert('insert into alunos values(null, ?, ?, ?, ?, ?, ?)',
        [name, email, monthlyPayment, phone, situation.toInt(), observation]);
  }

  //READ
  Future<List<Map<String, Object?>>> getStudets() async {
    final result = await database.query('alunos');
    return result;
  }

  Future<List<Map<String, Object?>>> getStudetById(int id) async {
    final result = await database.rawQuery('select * from alunos where id = ?', [id]);
    return result;
  }

  //UPDATE
  Future<void> updateStudents({
    required String name,
    required String email,
    required String phone,
    required bool situation,
    required String observation,
    required String monthlyPayment,
    required int id,
  }) async {
    await database.rawUpdate(
        'update alunos set name = ?, email = ?, monthly_payment = ?, phone = ?, situation = ?, observation = ? where id = ? ',
        [name, email, monthlyPayment, phone, situation.toInt(), observation, id]);
  }

  //DELETE
  Future<void> deleteStudents(
    int id,
  ) async {
    await database.rawDelete('delete from alunos where id = ?', [id]);
  }
}
