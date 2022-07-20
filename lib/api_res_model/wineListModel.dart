// To parse this JSON data, do
//
//     final wineListModel = wineListModelFromJson(jsonString);

import 'dart:convert';

WineListModel wineListModelFromJson(String str) =>
    WineListModel.fromJson(json.decode(str));

String wineListModelToJson(WineListModel data) => json.encode(data.toJson());

class WineListModel {
  WineListModel({
    this.drinks,
  });

  List<Map<String, String>>? drinks;

  factory WineListModel.fromJson(Map<String, dynamic> json) => WineListModel(
        drinks: List<Map<String, String>>.from(json["drinks"].map((x) =>
            Map.from(x).map(
                (k, v) => MapEntry<String, String>(k, v == null ? null : v)))),
      );

  Map<String, dynamic> toJson() => {
        "drinks": List<dynamic>.from(drinks!.map((x) => Map.from(x).map(
            (k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
      };
}
