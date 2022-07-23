import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

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
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image(
                          image: NetworkImage('${GetStorage().read('image')}'),
                          height: Get.width - 20,
                          width: Get.width - 20,
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${GetStorage().read('data1')}',
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  '${GetStorage().read('title1')}',
                                  maxLines: 4,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: 3),
                                // Text(
                                //   '${snapshot.data['drinks'][index]['strIngredient1']}',
                                //   maxLines: 1,
                                //   style: TextStyle(
                                //     color: Colors.grey,
                                //     fontSize: 16,
                                //     fontWeight: FontWeight.normal,
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
