import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              SizedBox(height: 16.0),
             Center(
               child: ElevatedButton(
                 onPressed: () {
                   if (_formKey.currentState!.validate()) {
                     _formKey.currentState!.save();
                     Navigator.pop(
                       context,
                       Task(title: _title, description: _description),
                     );
                   }
                 },
                 child: Text('Save'),
               ),
             ),
            ],
          ),
        ),
      ),
    );
  }
}
class Task {
  final String title;
  final String description;

  Task({required this.title, required this.description});
}
