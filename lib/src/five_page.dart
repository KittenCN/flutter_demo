import 'package:flutter/material.dart';
import 'game2048/game2048panel.dart';

class FivePage extends StatefulWidget {
  const FivePage({Key? key}) : super(key: key);

  @override
  _FivePageState createState() => _FivePageState();
}

class _FivePageState extends State<FivePage> {
  int currentScore = 0;
  int highestScore = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          padding: const EdgeInsets.only(top: 30),
          color: Colors.white,
          child: Column(
            children: [
              Flexible(child: gameHeader()),
              Flexible(flex: 2, child: Game2048Panel()),
            ],
          ),
        ));
  }

  Widget gameHeader() {
    return Row(
      children: [
        const Text("2048"),
        Column(
          children: [
            Text("Score: $currentScore"),
            Text("Highest: $highestScore"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentScore = 0;
                });
              },
              child: const Text("New Game"),
            )
          ],
        )
      ],
    );
  }
}
