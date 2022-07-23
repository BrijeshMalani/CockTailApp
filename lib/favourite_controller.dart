import 'package:get/get.dart';

class FavouriteController extends GetxController {
  RxBool isFavourite = true.obs;

  favourite() {
    isFavourite.value = !isFavourite.value;
    update();
  }
}
