import 'package:get/get.dart';

class HomePageController extends GetxController {
  //**** GLOBAL APP CONTROLLER ****//

  var selectedIndex = 0.obs; // To observe the selected page
  List<dynamic> queue = [].obs;
  DateTime popTime = DateTime.now();

  Future<bool> quitApp() {
    //if navigation queue not empty, pop to previous page
    if (queue.isNotEmpty) {
      selectedIndex(queue[queue.length - 2]);
      queue.clear();
      print(queue.toString());
      return Future.value(false);
    } else if (popTime == null ||
        DateTime.now().difference(popTime) >
            Duration(seconds: 2)) /*showing 'press 2 times to quit*/ {
      selectedIndex(0);
      Get.snackbar("Tip:", "Tap two times to quit the app",
          snackPosition: SnackPosition.BOTTOM);
      popTime = DateTime.now();
      return Future.value(false);
    }
    //else quit the app
    return Future.value(true);
  }
}
