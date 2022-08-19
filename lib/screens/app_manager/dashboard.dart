
import 'package:flutter/material.dart';


class AppManagerDashboard extends StatefulWidget {
  //const Dashboard({Key? key}) : super(key: key);
  static const routeName = '/AppManagerDashboard';

  @override
  State<AppManagerDashboard> createState() => _AppManagerDashboardState();
}

class _AppManagerDashboardState extends State<AppManagerDashboard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final adminidcontroller = TextEditingController();
  final services = ['View Admins', 'Add Admin', 'Remove Admin', ];

  final icons = [
    Icons.view_list,
    Icons.person_add,
    Icons.person_remove,

  ];

  final colors = [
    Colors.amber,
    Colors.lightBlueAccent,
    Colors.greenAccent,

  ];
  List<String> viewAdmins = ['a','b','c'];
  var isViewing=false,isAdding=false,isRemoving=false;
  Future<void> submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    //api call to save data
    setState(() {
      //loading false
      //adding change
    });
  }
  Widget cnt(BuildContext context, int index) {
    return GestureDetector(
      onTap: (){
        switch (index){
          case 0:
            //api call to get list of admins
            setState(() {
              isViewing=true;
              isAdding=isRemoving=false;
            });
            break;
          case 1:

            setState(() {
              isAdding =true;
              isViewing=isRemoving=false;
            });
            break;
          case 2:
            setState(() {
              isRemoving=true;
              isViewing=isAdding=false;
            });
        }
      },
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(),
          color: Colors.white,
        ),
        height: 120,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child:Text(services[index],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  )
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
            /*Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(215, 100, 100, 1).withOpacity(0.5),
                      Color.fromRGBO(255, 100, 100, 1).withOpacity(0.9),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0, 1],
                  )),
            ),*/
            SingleChildScrollView(
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
                      'School Id',
                      style: TextStyle(color: Colors.white, fontSize: 18),
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

                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  isViewing?Container(
                    color: Colors.white,
                    child: ListView.builder(
                        shrinkWrap: true
                        ,itemBuilder: (context, index) {

                      return ListTile(title: Text(viewAdmins[index%viewAdmins.length]),);
                    },itemCount: 50,),
                  )
                      :isAdding?Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'AdminId',

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide()),
                          ),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Can\'t be empty';
                            }
                          },
                          onSaved: (value) {

                          },
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Admin Name',

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide()),
                          ),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Can\'t be empty';
                            }
                          },
                          onSaved: (value) {

                          },
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Mobile Number',

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide()),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value?.length != 10) {
                              return 'Enter 10 digit Mobile Number';
                            }
                          },
                          onSaved: (value) {

                          },
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Department',

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide()),
                          ),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Can\'t be empty';
                            }
                          },
                          onSaved: (value) {

                          },
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        ElevatedButton(
                          onPressed: submit,
                          child: Text(
                            'Save',
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
                      ],
                    ),
                  )
                        :isRemoving?Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Admin Id',

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide()),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Can\'t be empty';
                          }
                        },
                        onSaved: (value) {

                        },
                      ),
                      ElevatedButton(
                        onPressed: (){},//api call
                        child: Text(
                          'Remove',
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
                    ],
                  )

                          :Text('')
                ],
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
