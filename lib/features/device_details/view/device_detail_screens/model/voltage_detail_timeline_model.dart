

import 'package:auro/features/device_details/view/device_detail_screens/model/voltage_detail_value.dart';

class VoltageTimeline {
  List<Value>? value;

  VoltageTimeline({this.value});

  VoltageTimeline.fromJson(Map<String, dynamic> json) {
    if (json['value'] != null) {
      value = <Value>[];
      json['value'].forEach((v) {
        value!.add(new Value.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.value != null) {
      data['value'] = this.value!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}