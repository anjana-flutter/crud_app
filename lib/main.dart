
import 'package:crud_app/fire_store/org_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'normal/add_screen.dart';
void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  // await Hive.initFlutter();
  // await Hive.openBox('crud_box');

  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'CRUD APP' ,
        theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
     // home:TaskListScreen() ,
      home: Home_screen(),
    );
  }
}
