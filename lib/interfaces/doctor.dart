class Doctor {
  final String name;
  final String? avatar;
  final String job;
  final String department;
  final String hospital;

  const Doctor({
    required this.name,
    this.avatar,
    required this.job,
    required this.department,
    required this.hospital,
  });
}
