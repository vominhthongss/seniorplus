class IScheduleMedicationDrug {
  late String? id;
  late String drugName;
  late String content;
  late String quantity;
  IScheduleMedicationDrug(
      {this.id,
      required this.drugName,
      required this.content,
      required this.quantity});
  Map<String, dynamic> toJson() => {
        'id': id,
        'drugName': drugName,
        'content': content,
        'quantity': quantity
      };

  // factory IScheduleMedicationDrug.fromJson(Map<String, dynamic> json) {
  //   return IScheduleMedicationDrug(
  //     id: json['id'],
  //     drugName: json['drugName'],
  //     content: json['content'],
  //     quantity: json['quantity'],
  //   );
  // }
}
