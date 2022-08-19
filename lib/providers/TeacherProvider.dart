import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modal/Teacher.dart';

class TeacherProvider with ChangeNotifier{
  late Teacher loggedInSTeacher;

  void initialiseloggedInTeacher(Teacher user){
    this.loggedInSTeacher = user;
    notifyListeners();
  }
}