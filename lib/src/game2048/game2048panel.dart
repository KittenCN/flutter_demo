import 'package:flutter/material.dart';

class Game2048Panel extends StatefulWidget {
  final ValueChanged<int>? onScoreChanged;
  const Game2048Panel({Key? key, this.onScoreChanged})
      : super(key: key);
  @override
  _Game2048PanelState createState() => _Game2048PanelState();
}

class _Game2048PanelState extends State<Game2048Panel> {
  // ignore: constant_identifier_names
  static const int SIZE = 4;
  bool _isGameOver = false;
  @override
  Widget build(BuildContext context) {
    if (_isGameOver) {
      return Stack(
        children: [
          _buildGamePanel(context),
          _buildGameOverMask(context),
        ],
      );
    } else {
      return _buildGamePanel(context);
    }
  }

  Widget _buildGamePanel(BuildContext context) {
    return GestureDetector(
        child: AspectRatio(
            aspectRatio: 1.0,
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: SIZE,
                ),
                itemCount: SIZE * SIZE,
                itemBuilder: (context, index) {
                  return _buildGameCell(0);
                },
              ),
            )));
  }
  Widget _buildGameCell(int value) {
    return Text(
      value == 0 ? '' : value.toString(),
    );
  }
  Widget _buildGameOverMask(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Game Over"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isGameOver = false;
                });
              }, 
              child: const Text("Restart"),
            )
          ]
        )
      )
    );
  }
}
