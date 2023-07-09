import'package:intl/intl.dart';

class Val {
  static String? ValidationTitle(String, val) {
    return (val != null && val != "") ? null : "Title cannot be empyt";
  }

  static String? GetExpiryStr(String expires){}
}