import 'package:tracked/utils/validation.dart';

class Tasks {
  String? id;
  String? title;
  String? deadline;
  int? year;
  int? halfYear;
  bool isDone = false;


  Tasks(
      {this.id,
      this.title,
      this.deadline,
      this.year,
      this.halfYear,
      this.isDone = false
      });



  Tasks.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    deadline = json['deadline'];
    year = json['year'];
    halfYear = json['halfYear'];
  }



  Map<String, dynamic> toJson(){
    final Map<String,dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['title'] = title;
    data['deadline'] = deadline;
    data['year'] = year;
    data['halfyear'] = halfYear;

    return data;
  }

 void toggleDone(bool? newValue){
    isDone = newValue!;
  }
}
