import 'package:cocktaillwine/api_get_services/Api_get_services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../api_res_model/wineListModel.dart';

class WineController extends GetxController {
  RxBool isLoading = true.obs;
  // var newsdataList = <NewsGModel>[].obs;
  WineListModel? wineList;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchServices();
    super.onInit();
  }

  void fetchServices() async {
    isLoading(true);
    try {
      var Service = await ApiGetServices.wineservice();
      if (Service != null) {
        // newsdataList.value = Service;
        wineList = Service;
      }
    } finally {
      isLoading(false);
    }
  }
}
