// To parse this JSON data, do
//
//     final runningTimeModel = runningTimeModelFromJson(jsonString);

import 'dart:convert';

RunningTimeModel runningTimeModelFromJson(String str) => RunningTimeModel.fromJson(json.decode(str));

String runningTimeModelToJson(RunningTimeModel data) => json.encode(data.toJson());

class RunningTimeModel {
  String rowHead;
  int monVal;
  int tueVal;
  int wedVal;
  int thuVal;
  int friVal;
  int satVal;
  int sunVal;

  RunningTimeModel({
    required this.rowHead,
    required this.monVal,
    required this.tueVal,
    required this.wedVal,
    required this.thuVal,
    required this.friVal,
    required this.satVal,
    required this.sunVal,
  });

  factory RunningTimeModel.fromJson(Map<String, dynamic> json) => RunningTimeModel(
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

  static RunningTimeModel sampleData = RunningTimeModel(
    rowHead: "Running Time",
    sunVal: 11,
    monVal: 97,
    tueVal: 32,
    wedVal: 5,
    thuVal: 9,
    friVal: 34,
    satVal: 21,
  );
}
