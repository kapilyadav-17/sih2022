import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih/helpers/Homework.dart';

import '../modal/Student.dart';

class StudentProvider with ChangeNotifier{
  late Student loggedInStudent ;
  late List<Homework> homeworks;
  late List<String> studyMaterial,circular;

  void initialiseloggedInStudent(Student user){
    this.loggedInStudent = user;
    notifyListeners();
  }
  void initialisehomeworks(){

  }
  void initialisestudyMaterial(){

  }
  void initialiseCircular(){

  }

  Student get loggedInStudentUser =>loggedInStudent;
  List<Homework> get homeworksofUser=>homeworks;
  List<String> get studyMaterialFiles=>studyMaterial;
  List<String> get circularFiles=>circular;
}