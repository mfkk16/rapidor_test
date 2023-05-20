// To parse this JSON data, do
//
//     final jogingTimeModel = jogingTimeModelFromJson(jsonString);

import 'dart:convert';

JoggingTimeModel joggingTimeModelFromJson(String str) => JoggingTimeModel.fromJson(json.decode(str));

String joggingTimeModelToJson(JoggingTimeModel data) => json.encode(data.toJson());

class JoggingTimeModel {
  String rowHead;
  int monVal;
  int tueVal;
  int wedVal;
  int thuVal;
  int friVal;
  int satVal;
  int sunVal;

  JoggingTimeModel({
    required this.rowHead,
    required this.monVal,
    required this.tueVal,
    required this.wedVal,
    required this.thuVal,
    required this.friVal,
    required this.satVal,
    required this.sunVal,
  });

  factory JoggingTimeModel.fromJson(Map<String, dynamic> json) => JoggingTimeModel(
    rowHead: json["row_head"],
    monVal: json["mon_val"],
    tueVal: json["tue_val"],
    wedVal: json["wed_val"],
    thuVal: json["thu_val"],
    friVal: json["fri_val"],
    satVal: json["sat_val"],
    sunVal: json["sun_val"],
  );

  Map<String, dynamic> toJson() => {
    "row_head": rowHead,
    "mon_val": monVal,
    "tue_val": tueVal,
    "wed_val": wedVal,
    "thu_val": thuVal,
    "fri_val": friVal,
    "sat_val": satVal,
    "sun_val": sunVal,
  };

  static JoggingTimeModel sampleData = JoggingTimeModel(
    rowHead: "Jogging Time",
    sunVal: 32,
    monVal: 54,
    tueVal: 21,
    wedVal: 54,
    thuVal: 32,
    friVal: 36,
    satVal: 78,
  );
}
