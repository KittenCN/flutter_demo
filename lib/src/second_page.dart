import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  List<int> numList = [0, 0, 0, 0];
  List<int> ansList = [0, 0, 0, 0];
  var ansListR = [];
  int index = 0;
  List<bool> checkList = [false, false, false, false];
  void dfs(int dep) {
    if (dep > 3) {
      ansListR.add([ansList[0], ansList[1], ansList[2], ansList[3]]);
      return;
    }
    for (int i = 0; i < 4; ++i) {
      if (checkList[i] == true) {
        continue;
      } else {
        checkList[i] = true;
        ansList[dep] = numList[i];
        dfs(dep + 1);
        checkList[i] = false;
      }
    }
    return;
  }

  void testCal(String st) {
    setState(() {
      List<String> stList = st.split(' ');
      numList = stList.map(int.parse).toList();
      dfs(0);
      for (int i = 0; i < ansListR.length; i++) {
        _controller2.text += ansListR[i].toString() + '\n';
      }
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
          child: Column(children: <Widget>[
            TextField(
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Type something',
              ),
              controller: _controller,
            ),
            ElevatedButton(
              child: const Text('Test Cal!'),
              onPressed: () {
                testCal(_controller.text);
              },
            ),
            Expanded(child: 
              ListView.separated(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: ansListR.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(ansListR[index].toString());
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(color: Colors.blue);
                },
              ),
            ) 
          ],
        )
      ),
    );
  }
}
