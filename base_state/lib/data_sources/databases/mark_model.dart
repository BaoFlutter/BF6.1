import 'package:flutter/material.dart';
class MarkModel {
  int? mark_id;
  String? mark_average;
  String? grade;


  MarkModel({ @required this.mark_id, @required this.mark_average, @required this.grade});

  // From Json
  factory MarkModel.fromJson(json){
    return MarkModel(
      mark_id: json['mark_id'],
      mark_average: json['mark_average'],
      grade: json['grade'],
      );
  }

  // to Json
  toJson()
  {
    return {
      "mark_id": this.mark_id,
      "mark_average": this.mark_average,
      "grade": this.grade,
    };

  }

}