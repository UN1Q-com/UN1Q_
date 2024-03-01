class TimeUtils {
  static DateTime toDate(String date) {
    return DateTime.parse(toLongString(date));
  }

  static String toLongString(String shortDate) {
    if (shortDate.isEmpty) return '';
    return '${shortDate.substring(3)}-${shortDate.substring(0, 2)}-01';
  }

  static String yyyymmdd(String date) {
    // regex to determine if date is in this format DD/MM/YYYY.
    final regExp = RegExp(r'(\d{2}/\d{2}/\d{4})');
    if (regExp.hasMatch(date)) {
      // converts date to this format YYYY-MM-DD
      return '''${date.substring(6, 10)}-${date.substring(3, 5)}-${date.substring(0, 2)}''';
    }
    return date;
  }
}
