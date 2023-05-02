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
}
