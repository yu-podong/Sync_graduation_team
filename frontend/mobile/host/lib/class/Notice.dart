class Notice {
  String title;
  String date;
  String time;
  int level;
  String content;

  Notice(
      {required this.title,
      required this.date,
      required this.time,
      required this.level,
      required this.content});

  int getLevel() {
    return this.level;
  }
}
