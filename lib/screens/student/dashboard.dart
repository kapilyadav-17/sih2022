
import 'package:flutter/material.dart';
import 'package:sih/providers/studentProvider.dart';
import 'package:sih/screens/student/attendence.dart';
import 'package:sih/screens/student/homework.dart';
import 'package:sih/screens/student/circular.dart';
import 'package:sih/screens/student/learning_resource.dart';
import 'package:provider/provider.dart';
class StudentDashboard extends StatelessWidget {
  //const Dashboard({Key? key}) : super(key: key);
  static const routeName = '/StudentDashboard';
  final services = ['Homework', 'Circular', 'Attendance', 'Learning'];
  final icons = [
    Icons.book,
    Icons.newspaper,
    Icons.person_add_alt,
    Icons.bookmark_outlined
  ];
  final colors = [
    Colors.amber,
    Colors.lightBlueAccent,
    Colors.greenAccent,
    Colors.redAccent
  ];
  final routes = [
    StudentHomework.routeName,
    Circular.routeName,
    StudentAttendence.routeName,
    StudentLearningResources.routeName
  ];
  Widget cnt(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routes[index]);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(),
          color: Colors.white,
        ),
        height: 100,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icons[index],
                    color: colors[index],
                    size: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(services[index],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              height: 10,
              color: colors[index],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loggedInStudent = Provider.of<StudentProvider>(context).loggedInStudentUser;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.school,
          color: Colors.black,
        ),
        title: Text(
          'School Name',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Stack(
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          width * 0.02, height * 0.03, width * 0.02, 2),
                      padding: EdgeInsets.symmetric(vertical: 7),
                      alignment: Alignment.center,
                      color: Colors.indigo,
                      child: Text(
                        'Student Name',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.fromLTRB(
                          width * 0.02, 0, width * 0.02, height * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.person,
                            size: 150,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Adm No.',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.3,
                                      child: Text(
                                        '286',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Father\'s Name',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.3,
                                      child: Text(
                                        'Father name',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Class',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.3,
                                      child: Text(
                                        'VII - A',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Mobile Number',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.3,
                                      child: Text(
                                        '1234321234',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Email Id',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.3,
                                      child: Text(
                                        'name@gmail.com',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          )

                          /*Column(mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(child: Text('286',style: TextStyle(color: Colors.black, ),)),
                              Flexible(child: Text('ghgj',style: TextStyle(color: Colors.black, ),)),
                              Flexible(child: Text('VII - A ',style: TextStyle(color: Colors.black, ),)),
                              Flexible(child: Text('32534535',style: TextStyle(color: Colors.black, ),)),
                              Flexible(child: Text('fagsfsfsf@gmail.com',style: TextStyle(color: Colors.black, ),)),
                            ],)*/
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            cnt(context, 0),
                            cnt(context, 1),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            cnt(context, 2),
                            cnt(context, 3),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Saved QR codes',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
GridView.builder(shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1 ),
                      itemBuilder: (ctx, index) {

                        return Container(child:Text(index.toString()));
                      },
                      padding: EdgeInsets.all(10),
                      itemCount: services.length,
                    ),
*/
//or use wrap with row