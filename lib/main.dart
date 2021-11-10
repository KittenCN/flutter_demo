import 'package:flutter/material.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePate(title: 'Flutter Demo Home Page'));
  }
}

class MyHomePate extends StatefulWidget {
  const MyHomePate({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePateState createState() {
    return _MyHomePateState();
  }
}

class _MyHomePateState extends State<MyHomePate> {
  int _counter = 0;
  String _cntState = 'odd';
  void _runner(){
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
      appBar: AppBar(title: Text(widget.title)),
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
