extension DateTimeExtension on DateTime {
  String toDaysAgo() {
    return '${DateTime.now().difference(this).inDays} day ago';
  }
}
