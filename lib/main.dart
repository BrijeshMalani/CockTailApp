import 'package:cocktaillwine/views/Bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cock Tail Wine',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Bottom_nav_bar(),
    );
  }
}
