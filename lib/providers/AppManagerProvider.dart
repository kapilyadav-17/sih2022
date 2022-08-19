import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modal/AppManager.dart';

class AppManagerProvider with ChangeNotifier{
  late AppManager loggedInAppManager;

  void initialiseloggedInAppManager(AppManager user){
    this.loggedInAppManager = user;
    notifyListeners();
  }
}