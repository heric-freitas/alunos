extension HelperDatabaseInt on int  {
  bool toBool() {
    return this == 1;
  }
}

extension HelperDatabaseBool on bool  {
  int toInt() {
    return this ? 1 : 0;
  }
}