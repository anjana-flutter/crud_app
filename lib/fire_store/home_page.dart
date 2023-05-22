import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(),
        actions: [
          IconButton(onPressed: () {
            final name =controller.text;
            createUser(name: name);
          }, icon: Icon(Icons.add))
        ],
      ),
    );
  }
  Future createUser({required String name}) async{
  final docUser = FirebaseFirestore.instance.collection('users').doc('my-id');
  final json ={
    'name': name,
  };
  await docUser.set(json);
  }
}