class CaracteristicModel {
  String? birth;
  int? weight;
  double? height;
  String? universe;

  CaracteristicModel({
    this.birth,
    this.weight,
    this.height,
    this.universe,
  });

  CaracteristicModel.fromJson(Map<String, dynamic> json) {
    birth = json['birth'];
    weight = json['weight']['value'];
    height = json['height']['value'];
    universe = json['universe'];
  }
}
