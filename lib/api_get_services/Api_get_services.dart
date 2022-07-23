import 'dart:convert';
import 'dart:ffi';

import 'package:cocktaillwine/api_routes/api_routes.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ApiGetServices {
  static Future wineservice() async {
    List info = [];
    http.Response response = await http.get(Uri.parse(ApiRoutes.wineUrl));

    if (response.statusCode == 200) {
      print("response =====>>>> Api Success");
      // var jsonString = response.body;
      // return wineListModelFromJson(jsonString);
      // final wineListModel = wineListModelFromJson(jsonString);

      var result = jsonDecode(response.body);

      info.add(result);
      var code = '${info[0]['drinks'][0]['strCategory']}';
      GetStorage().write('data1', code);
      return result;
    } else {
      print("response =====>>>> Api error");
      return Center(
        child: Text(
          "is Loading",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic,
              fontFamily: "Popins",
              letterSpacing: 2),
        ),
      );
    }
  }
}
