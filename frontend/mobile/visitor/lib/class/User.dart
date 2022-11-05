class User {
  // 소속
  String belong;
  // 직위
  String position;
  // 직책
  String duty;
  String name;
  String phoneNum;

  User({required this.belong, required this.position, required this.duty, required this.name, required this.phoneNum});

  setName(String name) {
    this.name = name;
  }
}