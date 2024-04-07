class DateFormatted {
  final int number;
  final String type;

  DateFormatted({required this.number, required this.type});
}

DateFormatted dateFormat(DateTime createdAt) {
  final DateTime now = DateTime.now();

  final Duration difference = now.difference(createdAt);

  if (difference.inMinutes < 1) {
    return DateFormatted(number: difference.inSeconds, type: "seconds");
  }
  if (difference.inHours < 1) {
    return DateFormatted(number: difference.inMinutes, type: "minutes");
  }
  if (difference.inDays < 1) {
    return DateFormatted(number: difference.inHours, type: "hours");
  }
  return DateFormatted(number: difference.inDays, type: "days");
}
