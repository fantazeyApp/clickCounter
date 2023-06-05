class CountModel {
  final int number;

  CountModel(this.number);

  CountModel copyWith({int? number}) {
    return CountModel(number ?? this.number);
  }
}
