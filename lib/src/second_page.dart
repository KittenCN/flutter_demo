import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);
  
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget> [
          TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Type something', 
          ),
          controller: _controller,
        ),
          ElevatedButton(
            child: const Text('Go back!'),
            onPressed: () {
              _controller2.text = _controller.text;
            },
          ),
          TextField(
            controller: _controller2,
          ),]
        )       
      ),
    );
  }
}
