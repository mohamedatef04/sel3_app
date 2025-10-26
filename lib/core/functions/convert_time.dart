String timeAgoArabic(String dateTimeString) {
  try {
    // Make sure it's in a valid ISO8601 format
    // PostgreSQL often returns `+00`, Dart wants `+00:00`
    String fixedString = dateTimeString.replaceFirst(' ', 'T');
    if (fixedString.endsWith('+00')) {
      fixedString = fixedString.replaceFirst('+00', '+00:00');
    }

    DateTime dateTime = DateTime.parse(fixedString).toLocal();
    Duration diff = DateTime.now().difference(dateTime);

    if (diff.inSeconds < 60) {
      return 'منذ ${diff.inSeconds} ثانية';
    } else if (diff.inMinutes < 60) {
      return 'منذ ${diff.inMinutes} دقيقة';
    } else if (diff.inHours < 24) {
      return 'منذ ${diff.inHours} ساعة';
    } else if (diff.inDays < 30) {
      return 'منذ ${diff.inDays} يوم';
    } else if (diff.inDays < 365) {
      return 'منذ ${(diff.inDays / 30).floor()} شهر';
    } else {
      return 'منذ ${(diff.inDays / 365).floor()} سنة';
    }
  } catch (e) {
    return 'تاريخ غير صالح';
  }
}
