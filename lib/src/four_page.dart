import 'package:flutter/material.dart';

class FourPage extends StatelessWidget {
  const FourPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Four'),
      ),
      body: Center(
        child: Column(
          children: [
            Icon(
              Icons.star,
              color: Colors.red[500],
            ),
            const Text('41'),
            const FavoriteWidget(),
          ]
        )
      ),
    );
  }
}


class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 0;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        if(_favoriteCount > 0) {
          _favoriteCount -= 1;
        }
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            padding: const EdgeInsets.all(0),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              alignment: Alignment.centerRight,
              icon: (_isFavorited
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border)),
              color: Colors.red[500],
              onPressed: _toggleFavorite,
            )),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}

