import 'package:flutter/material.dart';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
class UploadCircular extends StatefulWidget {
  const UploadCircular({Key? key}) : super(key: key);
  static const routeName = '/UploadCircular';
  @override
  _UploadCircularState createState() => _UploadCircularState();
}
//text also...
class _UploadCircularState extends State<UploadCircular> {
  String selectedKaksha = 'I';
  List<String> kaksha = ['I', 'II', 'III', 'IV', 'V']; //kaksha id... or name
  DateTime uploadDate = DateTime.now();
  File? file;
  var ispicked=false;
  var isuploaded=false;
  _pickFile() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path!);
      setState(() {
        ispicked=true;
      });
    } else {
      // User canceled the picker
      print('cannot pick file');
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upload_Circular',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Select Class : '),
                  DropdownButton(items:
                  kaksha.map((e) {
                    return DropdownMenuItem(child: Text(e),value: e,);
                  }).toList(), onChanged: (newvalue){

                  },value: selectedKaksha),

                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed:(){
                      _pickFile();
                      if(file!=null){
                        setState(() {
                          ispicked=true;
                        });
                      }
                    } ,
                    child: Text(
                      'Chooose File',
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
                  IconButton(onPressed: (){
                    //all gone ok
                    setState(() {
                      ispicked=false;
                      isuploaded=true;
                    });
                  }, icon: Icon(Icons.file_upload,color: Colors.black45,)),

                ],
              ),
              //show chosen file name
              SizedBox(height: 10,),
              ispicked?Text(file!.path):
              isuploaded?Text('uploaded successfully'):Text('No file chosen ')
            ],
          ),
        ),
      ),
    );
  }
}
