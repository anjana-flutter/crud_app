import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Page_1 extends StatefulWidget {
  const Page_1({Key? key}) : super(key: key);

  @override
  State<Page_1> createState() => _Page_1State();
}

class _Page_1State extends State<Page_1> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _datacontroller = TextEditingController();
  List<Map<String, dynamic>> _items = [];

  final _crudBox = Hive.box('crud_box');

  void _refreshItems() {
    final value = _crudBox.keys.map((key) {
      final item = _crudBox.get(key);

      return {"key": key, "name": item["name"], "data": item['data']};
    }).toList();
    setState(() {
      _items = value.reversed.toList();
      print(_items.length);
    });
  }

  //create New item
  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await _crudBox.add(newItem);
    print("data ${_crudBox.length}");
  }

  void _showForm(BuildContext ctx, int? itemKey) async {
    showModalBottomSheet(
      context: ctx,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom,
          top: 15,
          right: 15,
          left: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _namecontroller,
              decoration: InputDecoration(hintText: 'Name'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _datacontroller,
              decoration: InputDecoration(hintText: 'Data'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  _createItem(
                      {"name": _namecontroller, "data": _datacontroller});

                  //clear the text field
                  _namecontroller.text = '';
                  _datacontroller.text = '';
                  Navigator.of(context).pop();
                },
                child: Text('Create New')),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hive'),
      ),
      body:ListView.builder(itemCount: _items.length,
      itemBuilder: (context, index) {
      },) ,
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
