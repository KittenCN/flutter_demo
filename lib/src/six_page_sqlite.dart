import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'six_page_sqlite_dao.dart';

class SixPageLite extends StatefulWidget {
  const SixPageLite({Key? key}) : super(key: key);

  @override
  _SixPageLiteState createState() => _SixPageLiteState();
}

class _SixPageLiteState extends State<SixPageLite> {
  final TextEditingController _controller = TextEditingController();
  var strMemList = [];
  var boolMemList = [];
  DatabaseHelper databaseHelper = DatabaseHelper();

  Future getMemList() async {
    List list = await databaseHelper.getMemList();
    setState(() {
      for (int i = 0; i < list.length; i++) {
        strMemList.add(list[i].description);
        boolMemList.add(list[i].ischeck);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        getMemList();
        // strMemList = _controller.text.split(',');  
        // boolMemList = strMemList.map((str) => str.isNotEmpty).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SixPageLite-todoList'),
      ),
      body: Center(
          child: Column(children: <Widget>[
        TextField(
          autofocus: true,
          decoration: InputDecoration(
              labelText: 'Something want to do...',
              hintText: 'Something want to do...',
              prefixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _controller.clear();
                  });
                },
                icon: const Icon(Icons.add),
              )),
          controller: _controller,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              strMemList.add(_controller.text);
              boolMemList.add(0);
              Todo todo = Todo();
              todo.id = strMemList.length;
              todo.description = _controller.text;
              todo.ischeck = 0;
              databaseHelper.insert(todo);
              _controller.clear();
              FocusScope.of(context).requestFocus(FocusNode());
            });
          },
          child: const Text('Save'),
        ),
        Expanded(
            child: ListView.separated(
          shrinkWrap: true,
          itemCount: strMemList.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(children: <Widget>[
              Expanded(
                  child: ListTile(
                title: Text(strMemList[index]),
                tileColor: boolMemList[index] ? Colors.red : null,
                onTap: () {
                  setState(() {
                    // strMemList.removeAt(index);
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
              )),
              Checkbox(
                value: boolMemList[index],
                onChanged: (bool? value) {
                  setState(() {
                    boolMemList[index] = boolMemList[index] ? false : true;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
              )
            ]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(color: Colors.blue);
          },
        ))
      ])),
    );
  }
}
