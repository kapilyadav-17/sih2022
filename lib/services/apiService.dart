// import 'dart:convert';
// import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:sih/modal/Admin.dart';
// import 'package:sih/modal/AppManager.dart';
// import 'package:sih/modal/Teacher.dart';
// import 'package:sih/modal/request.dart';
// import 'package:sih/modal/response.dart';
// import 'package:sih/providers/AdminProvider.dart';
// import 'package:sih/providers/AppManagerProvider.dart';
// import 'package:sih/providers/TeacherProvider.dart';
// import 'package:sih/providers/studentProvider.dart';
//
// import '../config.dart';
// import '../modal/Student.dart';
//
// class ApiService {
//   static var client = http.Client();
//   static Future<void> login(BuildContext context,LoginRequest model) async{
//     try{
//       Map<String,String> requestHeader = {'Content-Type': 'application/json'};
//       //var url = Uri.http(Config.apiUrl);
//       print(Config.apiUrl);
//       var response = await client.post(Uri.parse(Config.loginApi),
//           headers: requestHeader, body: jsonEncode(model.toJson()));
//
//
//       if (response.statusCode == 200) {
//          String jwtToken = loginResponseJson(response.body).access;
//
//         switch(model.userRole){
//           case 1:
//             Map<String,dynamic> decodedToken = JwtDecoder.decode(jwtToken);
//
//             //AppManager model=AppManager(schoolName: decodedToken["schoolName"], schoolId: decodedToken["schoolId"],schoolImage: decodedToken["schoolImage"]);
//
//            //Provider.of<AppManagerProvider>(context,listen: false).initialiseloggedInAppManager(model);
//             break;
//           case 2:
//             Map<String,dynamic> decodedToken = JwtDecoder.decode(jwtToken);
//             //Admin model = Admin(adminId: decodedToken["hodId"], schoolId: decodedToken["schoolId"], emailId: decodedToken["email"], phoneNumber: decodedToken["phone"], adminName: decodedToken["hodName"]);
//             //Provider.of<AdminProvider>(context,listen: false).initialiseloggedAdmin(model);
//             break;
//           case 3:
//             Map<String,dynamic> decodedToken = JwtDecoder.decode(jwtToken);
//             //Teacher model = Teacher(empNo: decodedToken["empNo"], name: decodedToken["empName"], fatherName: decodedToken["fatherName"], schoolId: decodedToken["schoolId"], department: decodedToken["department"]);
//             //Provider.of<TeacherProvider>(context,listen: false).initialiseloggedInTeacher(model);
//             break;
//           case 4:
//             Map<String,dynamic> decodedToken = JwtDecoder.decode(jwtToken);
//             //Student model = Student(admNo: decodedToken["admNo"], name: decodedToken["name"], schoolId: decodedToken["schoolId"], fatherName: decodedToken["fatherName"], kakshaId: decodedToken["kakshaId"]);
//             //Provider.of<StudentProvider>(context,listen: false).initialiseloggedInStudent(model);
//             break;
//
//
//         }
//
//         // return true;
//       } else {
//         //return false;
//       }
//     }catch (error) {
//       rethrow;
//     }
//   }
//   static Future<void> fetchHomework (BuildContext,String userId,DateTime homeworkDate)async {
//     try{
//       Map<String,String> requestHeader = {'Content-Type': 'application/json'};
//       var url = Uri.http(Config.apiUrl, Config.fetchHomework);
//       var response = await client.post(url,
//           headers: requestHeader, body: json.encode({
//             "userId":userId,
//             "Date":homeworkDate
//           }));
//       if(response.statusCode==200){
//         //list 2d??
//       }
//       else{
//
//       }
//     }catch (error) {
//       rethrow;
//     }
//   }
//
//   static Future<bool> uploadHomeworkApi ( BuildContext context , UploadHomeWork model) async{
//     try{
//       Map<String,String> requestHeader = {'Content-Type': 'application/json'};
//       var url = Uri.http(Config.apiUrl, Config.uploadHomework);
//       var response = await client.post(url,headers:  requestHeader,body: jsonEncode(model.toJson()));
//       if(response.statusCode==200){
//         return true;
//       }
//       return false;
//     }catch (error) {
//       rethrow;
//     }
//   }
//
//
//   /*static Future<bool> viewKakshaOfSchool (BuildContext context,String schoolId) async{
//     try{
//       Map<String,String> requestHeader = {'Content-Type': 'application/json'};
//       var url = Uri.http(Config.apiUrl, Config.kakshaOfSchool);
//       var response = await client.get(url,)
//
//
//       if(response==200){
//         //decode json response and return -1,0,1
//
//       }
//       else{
//
//       }
//
//     }catch (error) {
//       rethrow;
//     }
//
//   }*/
//
//   /*static Future<int> todayAttendance(BuildContext context,String userId,DateTime todayDate,String schoolId)async {
//     try{
//       Map<String,String> requestHeader = {'Content-Type': 'application/json'};
//       var url = Uri.http(Config.apiUrl, Config.todayAttendance);
//       var response = await client.post(url,
//           headers: requestHeader, body: json.encode({
//             "userId":userId,
//             "Date":todayDate,
//             "schoolId":schoolId
//           }));
//       if(response.statusCode==200){
//         //decode json response and return -1,0,1
//       }
//       else{
//
//       }
//     }catch (error) {
//       rethrow;
//     }
//   }*/
//   //download circular
//   //material
// }
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path/path.dart';
import 'package:sih/config.dart';
import 'package:sih/screens/login.dart';
import 'package:http/http.dart' as http;
class ApiService{
  final storage = FlutterSecureStorage();
  void logout(context) async{
    await storage.delete(key: "access").whenComplete(() =>  Navigator.pushNamedAndRemoveUntil(
        context, Login.routeName, (Route<dynamic> route) => false));
  }

  asyncFileUpload(String text, File file, BuildContext context) async{
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest("POST", Uri.parse(Config.contentUpload),);
    //add text fields
    request.fields["type"] = text;
    request.fields["name"] = "some";
    request.fields["standardId"] = "93e004d5-65ed-42ec-9aaf-eed25b24b03e";
    request.fields["subjectId"] = "7ff1e12c-5b2d-48d2-a3b2-f8c22bf72ac0";


    //create multipart using filepath, string or bytes
    var pic = await http.MultipartFile.fromPath("file", file.path);
    //add multipart to request
    request.files.add(pic);


    Map<String, String> token = {};
    await storage.read(key: "access").then((value) async{
      token['Authorization'] = "Bearer "+value!;
      print("#################################");
      print(token);
      request.headers.addAll(token);
      var response = await request.send();
      //Get the response from the server
      //var responseData = await response.stream.toBytes();
      //var responseString = String.fromCharCodes(responseData);
      if(response.statusCode==200){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('File uploaded successfully'))
        );
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Something went wrong, server error!'))
        );
      }
    });





  }


  getClasses()async{
    Map<String,String> token = {};
    await storage.read(key: "access").then((value) async{
      token['Authorization'] = "Bearer "+value!;
    });
    var res = await http.post(Uri.parse(Config.getClass),headers: token);
    if(res.statusCode==200){

    }

  }
}