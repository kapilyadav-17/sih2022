import 'dart:convert';

class Homework{
  late String teacherName;
  late String subjectName;
  late DateTime homeworkDate;
  late String homeworkContent;
  Homework({required this.teacherName,required this.subjectName,required this.homeworkContent,required this.homeworkDate});
  Homework.fromJson(Map<String, dynamic> json) {
    teacherName = json['teacherName'];
    subjectName = json['subjectName'];
    homeworkDate = json['homeworkDate'];
    homeworkContent = json['homeworkContent'];

  }
}

Homework Homeworkjson(String str) =>
    Homework.fromJson(json.decode(str));