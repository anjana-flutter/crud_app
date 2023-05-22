import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _datacontroller = TextEditingController();
  void initState() {
    super.initState();
    TextEditingController _namecontroller = TextEditingController();
    TextEditingController _datacontroller = TextEditingController();
  }

  @override
  void dispose() {
    _namecontroller.dispose();
    super.dispose();
  }

  Future<void> addDataToCloudStore() async {
    String name = _namecontroller.text;
    String data = _datacontroller.text;

    // Clear data from the screen
    setState(() {
      _namecontroller.clear();
      _datacontroller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

              ),
              child: TextFormField(
                controller: _namecontroller,
                decoration: InputDecoration(
                    hintText: 'Name'
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white38
              ),
              child: TextFormField(
                controller: _datacontroller,
                decoration: InputDecoration(
                    hintText: 'data'
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                    Map<String,dynamic> note ={
                     "name" : _namecontroller.text,
                     "data" : _datacontroller.text
                    };
                    final docUser = FirebaseFirestore.instance.collection('users').add(note);
                    // var collection = FirebaseFirestore.instance.collection('user');
                    // collection
                    //     .doc() // <-- Doc ID to be deleted.
                    //     .delete();
                },
                 child: Text('Enter')),


          ],
        ),
      ),
    );
  }
}

//await firestore.collection('your_collection').doc('your_document').delete();
