// To parse this JSON data, do
//
//     final exerciseTimeModel = exerciseTimeModelFromJson(jsonString);

import 'dart:convert';

ExerciseTimeModel exerciseTimeModelFromJson(String str) => ExerciseTimeModel.fromJson(json.decode(str));

String exerciseTimeModelToJson(ExerciseTimeModel data) => json.encode(data.toJson());

class ExerciseTimeModel {
  String rowHead;
  int monVal;
  int tueVal;
  int wedVal;
  int thuVal;
  int friVal;
  int satVal;
  int sunVal;

  ExerciseTimeModel({
    required this.rowHead,
    required this.monVal,
    required this.tueVal,
    required this.wedVal,
    required this.thuVal,
    required this.friVal,
    required this.satVal,
    required this.sunVal,
  });

  factory ExerciseTimeModel.fromJson(Map<String, dynamic> json) => ExerciseTimeModel(
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

  static ExerciseTimeModel sampleData = ExerciseTimeModel(
    rowHead: "Exercise Time",
    sunVal: 67,
    monVal: 9,
    tueVal: 21,
    wedVal: 42,
    thuVal: 88,
    friVal: 21,
    satVal: 2,
  );
}
