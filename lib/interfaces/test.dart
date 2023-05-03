class Test {
  final String key;

  const Test({
    required this.key,
  });

  factory Test.fromJson(Map<String, dynamic> json) {
    return Test(
      key: json['key'],
    );
  }
}
