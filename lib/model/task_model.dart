import 'package:tracked/utils/validation.dart';

class Tasks {
  int? id;
  String? title;
  String? deadline;
  int? year;
  int? halfYear;
  int? quarter;
  int? month;

  Tasks(
      {this.id,
      this.title,
      this.deadline,
      this.year,
      this.halfYear,
      this.quarter,
      this.month});

  Tasks.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    deadline = json['deadline'];
    year = json['year'];
    halfYear = json['halfYear'];
    quarter = json['quarter'];
    month = json['month'];
  }



  Map<String, dynamic> toJson(){
    final Map<String,dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['title'] = title;
    data['deadline'] = deadline;
    data['year'] = year;
    data['halfyear'] = halfYear;
    data['quarter'] = quarter;
    data['month'] = month;

    return data;
  }
}
