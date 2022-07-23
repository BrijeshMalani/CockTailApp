import 'package:cocktaillwine/views/Bottom_nav_bar.dart';
import 'package:cocktaillwine/views/detail_page_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  GetStorage.init();
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
      home: //
          Bottom_nav_bar(),
      // DetailPageUi(),
    );
  }
}
