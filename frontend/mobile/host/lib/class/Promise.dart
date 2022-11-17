class Promise {
  String hostName;
  String visitName;
  String position;
  String place;
  String date;
  String time;
  bool isOK;

  Promise ({
    required this.hostName,
    required this.visitName,
    required this.position,
    required this.place,
    required this.date,
    required this.time,
    this.isOK = false
  });
}