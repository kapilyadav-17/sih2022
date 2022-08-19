import 'package:flutter/material.dart';

class UploadHomework extends StatefulWidget {
  const UploadHomework({Key? key}) : super(key: key);
  static const routeName = '/UploadHomework';
  @override
  _UploadHomeworkState createState() => _UploadHomeworkState();
}

class _UploadHomeworkState extends State<UploadHomework> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final hwcontroller = TextEditingController();
  Future<void> save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();


  }
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  String selectedkaksha = '';
  Map<String,List<String>> kaksha = {'I':['English','Hindi'], 'II':['English','Hindi','Maths'], 'III':['English','Hindi','Maths','Evs']}; //kaksha id... or name
  List<String> kakshaName=[];
  List<String> subjects=[];
  String selectdSubject = '';
  setsubjects(k){
    kaksha.forEach((key, value) {
      if(key==k){
        subjects=value;
      }
    });
    selectdSubject=subjects[0];
  }
  setkakshaName(){
    kaksha.forEach((key, value) {
      kakshaName.add(key);
    });
    selectedkaksha=kakshaName[0];
  }
  var isadding = false;
  var isSaved = false;
  @override
  void initState() {
    setkakshaName();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upload Homework',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton(items:
                      kakshaName.map((e) {
                        return DropdownMenuItem(child: Text(e),value: e,);
                      }).toList(), onChanged: (newvalue){
                      setsubjects( newvalue);
                      setState(() {
                        selectedkaksha=newvalue.toString();
                        if(!isadding){
                          isadding=true;
                        }
                      });

                  },value: selectedkaksha),
                  DropdownButton(items: subjects.map((e){
                    return DropdownMenuItem(child: Text(e),value: e,);
                  }).toList(), onChanged: (newvalue){
                    setState(() {
                      selectdSubject=newvalue.toString();
                    });
                  },value: selectdSubject,)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Select Date : '),
                  ElevatedButton(
                      onPressed: (){
                        _selectDate(context);

                      },
                      child: Text(selectedDate.toString())),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              isadding
                  ? Card(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.02),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.02,
                            vertical:
                                MediaQuery.of(context).size.height * 0.02),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(),
                          color: Colors.blue,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Teacher\'s Name - ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Subject Name',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),

                              ],
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                              Text(
                                '($selectedDate)',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],),
                            Divider(
                              color: Colors.white,
                              thickness: 2,
                              endIndent:
                                  MediaQuery.of(context).size.width * 0.02,
                              indent: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Form(
                              key: _formKey,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 4,vertical: 5),
                                height: MediaQuery.of(context).size.height*0.3,
                                color: Colors.white,
                                child: TextFormField(
                                  expands: true,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    labelText: 'Write here...',

                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide()),
                                  ),
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please write something';
                                    }
                                  },
                                  controller: hwcontroller,
                                ),
                              ),


                            ),
                            SizedBox(height: 5,),
                            ElevatedButton(onPressed: (){
                              save();
                              setState(() {
                                isSaved=true;
                                isadding=false;
                              });
                            }, child: Text('Save'))
                          ],
                        ),
                      ),
                    )
                  : isSaved
                      ? Text('Saved successfully')
                      : Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
