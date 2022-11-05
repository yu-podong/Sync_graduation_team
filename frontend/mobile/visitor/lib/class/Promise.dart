class Promise {
  String hostName;
  String position;
  String place;
  String date;
  String time;
  bool isOK;

  Promise({
    required this.hostName,
    required this.position,
    required this.place,
    required this.date,
    required this.time,
    this.isOK = false
  });
}