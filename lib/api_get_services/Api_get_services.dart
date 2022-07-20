import 'dart:convert';

import 'package:cocktaillwine/api_routes/api_routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiGetServices {
  static Future wineservice() async {
    http.Response response = await http.get(Uri.parse(ApiRoutes.wineUrl));

    if (response.statusCode == 200) {
      print("response =====>>>> Api Success");
      // var jsonString = response.body;
      // return wineListModelFromJson(jsonString);
      // final wineListModel = wineListModelFromJson(jsonString);

      return jsonDecode(response.body);
    } else {
      print("response =====>>>> Api error");
      return Center(
        child: Text(
          "is Loading",
          style: TextStyle(),
        ),
      );
    }
  }
}
