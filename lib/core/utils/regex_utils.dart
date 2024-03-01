class RegExUtil {
  static final emailRegExp = RegExp(
    r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$',
    caseSensitive: false,
    multiLine: false,
  );
  static final validShortDate = RegExp(
    r'^[0-9]{2,}/[0-9]{4,}$',
    caseSensitive: false,
    multiLine: false,
  );
}
