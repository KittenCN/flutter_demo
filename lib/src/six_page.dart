import 'package:flutter/material.dart';

class SixPage extends StatefulWidget {
  const SixPage({Key? key}) : super(key: key);

  @override
  _SixPageState createState() => _SixPageState();
}

class _SixPageState extends State<SixPage> {
  final TextEditingController _controller = TextEditingController();
  var strMemList = [];
  var boolMemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SixPage-todoList'),
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
              boolMemList.add(false);
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
