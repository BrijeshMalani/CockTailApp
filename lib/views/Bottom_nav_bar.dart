import 'package:cocktaillwine/views/Favoritepage_ui.dart';
import 'package:cocktaillwine/views/Homepage_ui.dart';
import 'package:cocktaillwine/views/Searchpage_ui.dart';
import 'package:flutter/material.dart';

class Bottom_nav_bar extends StatefulWidget {
  const Bottom_nav_bar({Key? key}) : super(key: key);

  @override
  State<Bottom_nav_bar> createState() => _Bottom_nav_barState();
}

class _Bottom_nav_barState extends State<Bottom_nav_bar> {
  int selector = 0;

  List _widgetOptions = [
    HomePage_ui(),
    FavoritePage_ui(),
    SearchPage_ui(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[selector],
      bottomNavigationBar: Stack(children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.star_border_outlined,
                  ),
                  label: 'Liked'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
            ],
            currentIndex: selector,
            onTap: (_index) {
              setState(() {
                selector = _index;
              });
            },
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,
            showUnselectedLabels: false,
            backgroundColor: Color(0xff1e1d1d),
          ),
        )
      ]),
    );
  }
}
