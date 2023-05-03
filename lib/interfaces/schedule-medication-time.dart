class IScheduleMedicationTime {
  late String id;
  late String time;
  IScheduleMedicationTime({required this.id, required this.time});

  Map<String, dynamic> toJson() => {'id': id, 'time': time};
  // factory IScheduleMedicationTime.fromJson(Map<String, dynamic> json) {
  //   return IScheduleMedicationTime(
  //     id: json['id'],
  //     time: json['time'],
  //   );
  // }
}
