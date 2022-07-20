import 'package:flutter/material.dart';

class SearchPage_ui extends StatefulWidget {
  const SearchPage_ui({Key? key}) : super(key: key);

  @override
  State<SearchPage_ui> createState() => _SearchPage_uiState();
}

class _SearchPage_uiState extends State<SearchPage_ui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("home", textScaleFactor: 2),
        ],
      ),
    );
  }
}
