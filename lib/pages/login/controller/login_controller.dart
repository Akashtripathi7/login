import 'package:get/get.dart';
import 'package:login/pages/login/login.dart';
import 'package:login/pages/main_page/main_page.dart';
import 'package:login/shared/api.dart';
import 'package:login/shared/widgets/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final token = ''.obs;
  final id = ''.obs;
  final email = ''.obs;
  final password = ''.obs;
  final isLoading = false.obs;

  // Function to handle the login process
  login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      isLoading.value = true;
      final data = await API.post(
          API.LOGIN, {"email": email.value, "password": password.value},
          auth: false);

      print('data=======> $data');

      if (data != null && data['accessToken'] != null) {
        // If the login is successful, store the token in the controller and shared preferences
        token.value = data['accessToken'];
        await prefs.setString('token', data['accessToken']);

        await prefs.setBool('isLoggedIn', true);
        toast('Login Succesfull!! ');

        // Navigate to the main page
        Get.offAll(() => MainPage(), transition: Transition.downToUp);
        isLoading.value = false;
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  // Function to handle the app boot process
  boot() async {
    var prefs = await SharedPreferences.getInstance();

    // Check if the user is logged in
    bool logged = await isLoggedIn();
    if (logged) {
      // If logged in, retrieve the token and navigate to the main page
      token.value = prefs.getString('token') ?? '';

      Get.offAll(MainPage(), transition: Transition.downToUp);
    } else {
      // If not logged in, navigate to the login page
      Get.offAll(Login(), transition: Transition.leftToRight);
    }
  }

  // Function to check if the user is logged in
  isLoggedIn() async {
    var prefs = await SharedPreferences.getInstance();

    final bool logged = prefs.getBool('isLoggedIn') ?? false;
    return logged;
  }

  // Function to handle the logout process
  logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isLoggedIn', false);

    await prefs.setString('token', '');

    email.value = '';
    password.value = '';

    prefs.clear();

    Get.offAll(Login());
  }
}
