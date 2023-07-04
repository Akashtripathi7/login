import 'package:get/get.dart';
import 'package:login/pages/login/controller/login_controller.dart';

class LandingConroller extends GetxController {
  LoginController auth = Get.put(LoginController());
  @override
  onInit() async {
    super.onInit();
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () async {
      auth.boot();
    });
  }
}
