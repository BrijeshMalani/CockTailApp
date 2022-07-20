import 'package:flutter/material.dart';

class FavoritePage_ui extends StatefulWidget {
  const FavoritePage_ui({Key? key}) : super(key: key);

  @override
  State<FavoritePage_ui> createState() => _FavoritePage_uiState();
}

class _FavoritePage_uiState extends State<FavoritePage_ui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("favorites", textScaleFactor: 2),
        ],
      ),
    );
  }
}
