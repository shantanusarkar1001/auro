class AvgPf {
  String? unit;
  double? value;

  AvgPf({this.unit, this.value});

  AvgPf.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit'] = this.unit;
    data['value'] = this.value;
    return data;
  }
}
