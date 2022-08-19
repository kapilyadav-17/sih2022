import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sih/modal/AppManager.dart';
import 'package:sih/modal/Teacher.dart';
import 'package:sih/modal/request.dart';
import 'package:sih/providers/AppManagerProvider.dart';
import 'package:sih/providers/TeacherProvider.dart';
import 'package:sih/providers/studentProvider.dart';

import '../config.dart';
import '../modal/Student.dart';

class ApiService {
  static var client = http.Client();
  static Future<void> login(BuildContext context,LoginRequest model) async{
    try{
      Map<String,String> requestHeader = {'Content-Type': 'application/json'};
      var url = Uri.http(Config.apiUrl, Config.loginApi);
      var response = await client.post(url,
          headers: requestHeader, body: jsonEncode(model.toJson()));
      if (response.statusCode == 200) {
        switch(model.userRole){
          case 1:
            Provider.of<AppManagerProvider>(context,listen: false).initialiseloggedInAppManager(AppManagerjson(response.body));
            break;
          case 2:
            break;
          case 3:
            Provider.of<TeacherProvider>(context,listen: false).initialiseloggedInTeacher(Teacherjson(response.body));
            break;
          case 4:
            Provider.of<StudentProvider>(context,listen: false).initialiseloggedInStudent(Studentjson(response.body));
            break;


        }

        // return true;
      } else {
        //return false;
      }
    }catch (error) {
      rethrow;
    }
  }
  static Future<void> fetchHomework (BuildContext,String userId,DateTime homeworkDate)async {
    try{
      Map<String,String> requestHeader = {'Content-Type': 'application/json'};
      var url = Uri.http(Config.apiUrl, Config.fetchHomework);
      var response = await client.post(url,
          headers: requestHeader, body: json.encode({
            "userId":userId,
            "Date":homeworkDate
          }));
      if(response.statusCode==200){
        //list 2d??
      }
      else{

      }
    }catch (error) {
      rethrow;
    }
  }
  /*static Future<int> todayAttendance(BuildContext context,String userId,DateTime todayDate,String schoolId)async {
    try{
      Map<String,String> requestHeader = {'Content-Type': 'application/json'};
      var url = Uri.http(Config.apiUrl, Config.todayAttendance);
      var response = await client.post(url,
          headers: requestHeader, body: json.encode({
            "userId":userId,
            "Date":todayDate,
            "schoolId":schoolId
          }));
      if(response.statusCode==200){
        //decode json response and return -1,0,1
      }
      else{

      }
    }catch (error) {
      rethrow;
    }
  }*/
  //download circular
  //material
}