import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sih/modal/request.dart';
import 'package:sih/screens/app_manager/dashboard.dart';
import 'package:sih/screens/employee/Tabs.dart';
import 'package:sih/screens/employee/dashboard.dart';
import 'package:sih/screens/forgot_password.dart';
import 'package:sih/screens/student/Tabs.dart';
import 'package:sih/screens/student/dashboard.dart';
import 'package:sih/services/apiService.dart';

class Login extends StatefulWidget {
  //const SelectRole({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  State<Login> createState() => _LoginState();
}

enum roles { Select_Role, AppManager, AppAdmin, Teacher, Student }

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var isloading = false;
  final useridcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  List<String> role = [
    'Select Role',
    'AppManager',
    'AppAdmin',
    'Teacher',
    'Student'
  ];
  Map<String, String> authData = {'phone': '', 'password': ''};
  Future<void> submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      isloading = true;
    });
    int roleindex = role.indexOf(roleName);
    model = LoginRequest(
        userId: useridcontroller.text,
        password: passcontroller.text,
        userRole: roleindex);
    if (roleindex == 0) {
      //select a role
    }
    print(roleindex);
    print(roleName);
    /*ApiService.login(context, model!).then((value) {
      switch(role){
        case 1:
          Navigator.pushReplacementNamed(context, AppManagerDashboard.routeName);
          break;
        case 2:
          //Navigator.pushReplacementNamed(context, AppManagerDashboard.routeName);
          break;
        case 3:
          Navigator.pushReplacementNamed(context, TeacherDashboard.routeName);
          break;
        case 4:
          Navigator.pushReplacementNamed(context, StudentDashboard.routeName);
          break;

      }
    }).catchError((onError){});*/
    switch (roleindex) {
      case 1:
        Navigator.pushReplacementNamed(context, AppManagerDashboard.routeName);
        break;
      case 2:
        //Navigator.pushReplacementNamed(context, AppManagerDashboard.routeName);
        print('abc');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, TeacherDashboard.routeName);
        break;
      case 4:
        Navigator.pushReplacementNamed(context, StudentDashboard.routeName);
        break;
    }
    setState(() {
      isloading = false;
    });
  }
  int i=0;
  roles selectedRole = roles.Select_Role;
  String roleName = 'Select Role';

  List<roles> r=[roles.Select_Role,roles.AppManager,roles.AppAdmin,roles.Teacher,roles.Student];
  LoginRequest? model;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
              Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 1],
          )),
        ),
        SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.symmetric(
                      vertical: height * 0.05, horizontal: width * 0.05),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 8,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Text(
                              'Welcome',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'Anton',
                                  fontSize: 25,
                                  fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Text('Start Using the App',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20)),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Mobile Number',
                                icon: Icon(Icons.phone_android),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide()),
                              ),
                              keyboardType: TextInputType.phone,
                              controller: useridcontroller,
                              validator: (value) {
                                if (value?.length != 10) {
                                  return 'Enter 10 digit Mobile Number';
                                }
                              },
                              onSaved: (value) {
                                authData['phone'] = value!;
                              },
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Password',
                                icon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide()),
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                }
                              },
                              controller: passcontroller,
                              onSaved: (value) {
                                authData['password'] = value!;
                              },
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Container(
                              height: height*0.1,
                              child: DropdownButton(elevation: 5,
                                  items: role.map((e) {
                                    return DropdownMenuItem(
                                        child: Container(
                                          width: width*0.5,
                                          child: ListTile(
                                            title: Text(e),
                                            trailing: Radio<roles>(
                                              value: r[role.indexOf(e)],
                                              groupValue: selectedRole,
                                              onChanged: (roles? newvalue) {
                                                setState(() {
                                                  selectedRole = newvalue!;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        value: e);
                                  }).toList(),
                                  onChanged: (newvalue) {
                                    setState(() {
                                      roleName = '$newvalue';
                                      selectedRole= r[role.indexOf(roleName)];
                                    });

                                  },
                                  value: roleName),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            isloading
                                ? CircularProgressIndicator(
                                    color: Colors.green,
                                  )
                                : ElevatedButton(
                                    onPressed: submit,
                                    child: Text(
                                      'Login',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      onPrimary: Colors.white,
                                      primary: Colors.black,
                                      minimumSize: Size(150, 50),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                  ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  child: Text('Forgot Password? '),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, ForgotPassword.routeName);
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.login,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              title: const Text('Sih says'),
                                              content: const Text(
                                                  'Your Registered Mobile No. with School may not be same as you entered. Please contact your School.'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'OK'),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Having Trouble Logging in ?',
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          onPrimary: Colors.black,
                                          primary: Colors.white,
                                          minimumSize: Size(150, 50),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
