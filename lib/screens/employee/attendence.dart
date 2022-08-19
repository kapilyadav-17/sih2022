import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MarkAttendence extends StatefulWidget {
  const MarkAttendence({Key? key}) : super(key: key);
  static const routeName = '/MarkAttendance';
  @override
  _MarkAttendenceState createState() => _MarkAttendenceState();
}

class _MarkAttendenceState extends State<MarkAttendence> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  //CalendarController _controller;
  DateTime _focusedDay = DateTime.now();

  DateTime _selectedDay = DateTime.now();
  String selectedkaksha = 'I';
  List<String> kaksha = ['I', 'II', 'III', 'IV', 'V']; //kaksha id... or name
  List<String> Students = [
    'a',
    'b',
    'c',
    'd'
  ]; //list based on id selected class//student id and name (MODAL REQUIREMENTto store data of students of a class like id name ..usme api call)
  List<int> atndnce = [
    -1,
    1,
    0,
    1
  ]; //how to show three statuses..bydefault -1 if opened and saved then 0 or 1
  var loadatndnce = false;
  var isSaved = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Homework',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //TableCalendar(firstDay: DateTime(2022,),lastDay: DateTime(2023),focusedDay: DateTime.now(),),
              TableCalendar(
                pageAnimationEnabled: false,

                firstDay: DateTime(2022),
                lastDay: DateTime(2023),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    // Call `setState()` when updating the selected day
                    setState(() {
                      _selectedDay =
                          selectedDay; //TODO update the hw list also api call

                      _focusedDay = focusedDay;
                    });
                  }
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    // Call `setState()` when updating calendar format
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  // No need to call `setState()` here
                  _focusedDay = focusedDay;
                },

                // Enable week numbers (disabled by default).
                //weekNumbersVisible: true,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Add attendence for ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _selectedDay.toLocal().toString(),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              //api call for list of classes of this school and student of selected class
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton(
                      value: selectedkaksha,
                      items: kaksha.map((k) {
                        return DropdownMenuItem(
                          child: Text(k),
                          value: k,
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedkaksha = '$newValue';
                        });
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          //api call
                          setState(() {
                            loadatndnce = true;
                            isSaved = false;
                          });
                        },
                        child: Text('Student Names'))
                  ],
                ),
              ),
              //listview
              loadatndnce
                  ? Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(Students[index]),
                              subtitle: Text(
                                atndnce[index] == 1
                                    ? 'Present'
                                    : atndnce[index] == 0
                                        ? 'Absent'
                                        : 'Not Marked',
                                style: TextStyle(
                                  color: atndnce[index] == 1
                                      ? Colors.lightGreenAccent
                                      : atndnce[index] == 0
                                          ? Colors.red
                                          : Colors.grey,
                                ),
                              ),
                              trailing: Switch(
                                value: atndnce[index] == 1,
                                onChanged: (newvalue) {
                                  setState(() {
                                    atndnce[index] = newvalue ? 1 : 0;
                                  });
                                },
                                activeTrackColor: Colors.green,
                                activeColor: Colors.black,
                                inactiveThumbColor: Colors.black,
                                inactiveTrackColor: Colors.red,
                              ),
                            );
                          },
                          itemCount: Students.length,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              //api call to update with atndnce list
                              setState(() {
                                isSaved = true;
                                loadatndnce = false;
                              });
                            },
                            child: Text('Save')),
                      ],
                    )
                  : isSaved
                      ? const Text('Attendance Saved Successfully')
                      : Text('')
            ],
          ),
        ),
      ),
    );
  }
}
