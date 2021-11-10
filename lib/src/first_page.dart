import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);
  @override
  _MyHomePateState createState() => _MyHomePateState();
}

class _MyHomePateState extends State<FirstPage> {
  int _counter = 0;
  String _cntState = 'odd';
  void _runner() {
    _incrementCounter();
    _checkCounter();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _checkCounter() {
    setState(() {
      _cntState = _counter % 2 == 0 ? 'even' : 'odd';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('First Page')),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                _cntState,
                style: Theme.of(context).textTheme.headline4,
              ),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _runner,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
