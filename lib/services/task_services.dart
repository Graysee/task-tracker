import 'dart:convert';
import 'package:tracked/model/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:tracked/model/task_model.dart';


class TaskService{
  static const URL = 'http://jsonplaceholder.typicode.com/users';

  Future<APIResponse<List<Tasks>>> getAllTasks() {
    return http.get(Uri.parse(URL)).then((value) {
      if (value.statusCode == 200) { ///if the value of statuscode = 200 which means success
        final jsonData = json.decode(value.body) as List; ///decode the body of the value in list format stored in json data variable using json.decode
        final listOfTasks = jsonData.map((data) /// map the JsonData to the APIResponse data as a list of users
        => Tasks.fromJson(data)).toList(); ///return the list of data using the user.fromJson method
        return APIResponse<List<Tasks>>(data: listOfTasks); ///returns the  Listofusers mapped to Apiresponse
      }
      return APIResponse<List<Tasks>>(
          isError: true, errorMessage: 'Error getting list of users'); ///if theres an error, returns an error message
    }).catchError((_) =>
        APIResponse<List<Tasks>>(
            isError: true, errorMessage: 'Error getting list of users')); ///catches an error and returns an error message
  }
}