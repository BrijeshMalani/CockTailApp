import 'dart:convert';

import 'package:cocktaillwine/api_get_services/Api_get_services.dart';
import 'package:cocktaillwine/favourite_controller.dart';
import 'package:cocktaillwine/views/detail_page_ui.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../api_controller/all_wine_controller.dart';
import '../api_routes/api_routes.dart';

class HomePage_ui extends StatefulWidget {
  const HomePage_ui({Key? key}) : super(key: key);

  @override
  State<HomePage_ui> createState() => _HomePage_uiState();
}

class _HomePage_uiState extends State<HomePage_ui> {
  WineController wineController = Get.put(WineController());
  FavouriteController favouriteController = Get.put(FavouriteController());

  bool favorite = false;

  String? name;

  List data = [];

  @override
  Widget build(BuildContext context) {
    // final kwidth = MediaQuery.of(context).size.width;

    print('Build method');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1f1f1f),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Cock Tail WIne',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 10),
            FutureBuilder(
              future: ApiGetServices.wineservice(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: (snapshot.data['drinks'] as List).length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        mainAxisExtent: Get.width + 100,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPageUi(
                                  strDrinkThumb:
                                      '${snapshot.data['drinks'][index]['strDrinkThumb']}',
                                  strCategory:
                                      '${snapshot.data['drinks'][index]['strCategory']}',
                                  strGlass:
                                      '${snapshot.data['drinks'][index]['strGlass']}',
                                  strAlcoholic:
                                      '${snapshot.data['drinks'][index]['strAlcoholic']}',
                                  strInstructions:
                                      '${snapshot.data['drinks'][index]['strInstructions']}',
                                  strIngredient1:
                                      '${snapshot.data['drinks'][index]['strIngredient1']}',
                                  strIngredient2:
                                      '${snapshot.data['drinks'][index]['strIngredient2']}',
                                  strIngredient3:
                                      '${snapshot.data['drinks'][index]['strIngredient3']}',
                                  strIngredient4:
                                      '${snapshot.data['drinks'][index]['strIngredient4']}',
                                  strIngredient5:
                                      '${snapshot.data['drinks'][index]['strIngredient5']}',
                                ),
                              ),
                            );
                            // Get.snackbar("detail$index", "description",
                            //     backgroundColor: Colors.white);
                            // Fluttertoast.showToast(
                            //     msg: "wine $index",
                            //     toastLength: Toast.LENGTH_SHORT,
                            //     gravity: ToastGravity.CENTER,
                            //     backgroundColor: Colors.red,
                            //     textColor: Colors.white,
                            //     fontSize: 16.0);
                          },
                          child: Card(
                            elevation: 5,
                            color: Colors.black,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image(
                                    image: NetworkImage(
                                        '${snapshot.data['drinks'][index]['strDrinkThumb']}'),
                                    height: Get.width - 20,
                                    width: Get.width - 20,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${snapshot.data['drinks'][index]['strCategory']}',
                                            maxLines: 2,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            '${snapshot.data['drinks'][index]['strAlcoholic']}',
                                            maxLines: 4,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            '${snapshot.data['drinks'][index]['strIngredient1']}',
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Obx(() {
                                        return InkWell(
                                          onTap: () {
                                            favouriteController.favourite();

                                            data.add([
                                              name = snapshot.data['drinks']
                                                  [index]['strCategory']
                                            ]);
                                            GetStorage().write('name1', name);

                                            if (favorite == false) {
                                              GetStorage().write(
                                                  'title',
                                                  // ${info[0]['drinks'][0]['strCategory']}
                                                  '${snapshot.data['drinks'][index]['strCategory']}');
                                              GetStorage().write('title1',
                                                  '${snapshot.data['drinks'][index]['strGlass']}');
                                              GetStorage().write('image',
                                                  '${snapshot.data['drinks'][index]['strDrinkThumb']}');
                                            } else {}
                                          },
                                          child: CircleAvatar(
                                            backgroundColor: Colors.grey,
                                            child: Icon(favouriteController
                                                    .isFavourite.value
                                                ? Icons.star
                                                : Icons.star_border_outlined),
                                          ),
                                        );
                                      })
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      "is Loading",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
