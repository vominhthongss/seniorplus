class IUser {
  late String fullName;
  late String sex;
  late String age;
  IUser({required this.fullName, required this.sex, required this.age});

  Map<String, dynamic> toJson() =>
      {'fullName': fullName, 'sex': sex, 'age': age};
}
