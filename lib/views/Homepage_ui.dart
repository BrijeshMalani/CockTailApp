import 'package:cocktaillwine/api_get_services/Api_get_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../api_controller/all_wine_controller.dart';

class HomePage_ui extends StatefulWidget {
  const HomePage_ui({Key? key}) : super(key: key);

  @override
  State<HomePage_ui> createState() => _HomePage_uiState();
}

class _HomePage_uiState extends State<HomePage_ui> {
  WineController wineController = Get.put(WineController());

  @override
  Widget build(BuildContext context) {
    // final kwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff1f1f1f),
      body: Column(
        children: [
          SizedBox(height: 10),
          FutureBuilder(
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
                      return Card(
                        elevation: 5,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image(
                                image: NetworkImage(
                                    '${snapshot.data['drinks'][index]['strDrinkThumb']}'),
                                height: Get.width - 10,
                                width: Get.width - 10,
                              ),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
            future: ApiGetServices.wineservice(),
          )
        ],
      ),
    );
  }
}
