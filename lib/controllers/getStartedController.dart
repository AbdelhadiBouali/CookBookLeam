import 'package:cookbook/tools/urls.dart';
import 'package:get/get.dart';
import 'package:renovation_core/core.dart';

class GetStartedController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    final renovationInstance = Renovation(); // To initialize Renovation
    await renovationInstance.init(urlBase, useJWT: true);
    super.onInit();
  }
}
