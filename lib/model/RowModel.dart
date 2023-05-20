// To parse this JSON data, do
//
//     final rowModel = rowModelFromJson(jsonString);

import 'dart:convert';

RowModel rowModelFromJson(String str) => RowModel.fromJson(json.decode(str));

String rowModelToJson(RowModel data) => json.encode(data.toJson());

class RowModel {
  String rowHead;
  int total;
  int monVal;
  int tueVal;
  int wedVal;
  int thuVal;
  int friVal;
  int satVal;
  int sunVal;

  RowModel({
    required this.rowHead,
    required this.total,
    required this.monVal,
    required this.tueVal,
    required this.wedVal,
    required this.thuVal,
    required this.friVal,
    required this.satVal,
    required this.sunVal,
  });

  factory RowModel.fromJson(Map<String, dynamic> json) => RowModel(
        rowHead: json["row_head"],
        total: json["total"],
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
        "total": total,
        "mon_val": monVal,
        "tue_val": tueVal,
        "wed_val": wedVal,
        "thu_val": thuVal,
        "fri_val": friVal,
        "sat_val": satVal,
        "sun_val": sunVal,
      };
}
