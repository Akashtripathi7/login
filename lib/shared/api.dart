// ignore_for_file: prefer_typing_uninitialized_variables, constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart' as Dio;

import 'package:get/get.dart';
import 'package:login/pages/login/controller/login_controller.dart';
import 'package:login/pages/login/login.dart';
import 'package:login/shared/widgets/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class API {
  static const BASE = "https://"; // url for api will be present here

  static const LOGIN = "$BASE/auth/login"; // dummy

  static getData(raw) async {
    try {
      Map<String, dynamic> json = jsonDecode(jsonEncode(raw));

      // Extracting relevant information from the JSON data
      final success = json['status'] == 'success' ? true : false;
      final code = json['code'];
      final String msg = json['message'];
      print("json=======================>${json}");

      if (success) {
        // If the request is successful and the 'data' field is not empty, returning the data
        return json['data'].isEmpty ? json : json['data'];
      } else {
        if (code == 401) {
          // If the request fails with a 401 status code (Unauthorized)
          // Cleared the logged-in status and navigate to the Login screen
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isLoggedIn', false);
          Get.to(Login());

          return null;
        } else {
          return json['data'].isEmpty ? json : json['data'];
        }
      }
    } catch (e) {
      // Handled any exceptions that occur during data processing
      print("errrrorrr=================>${e}");
      toast("oops something went wrong!");
    }
  }

  static post(url, data, {auth = true, put = false}) async {
    print("url ====> ${url}");
    print("data ===> ${data}");
    LoginController authc = Get.find();

    Dio.Response response;
    var dio = Dio.Dio();

    // If 'auth' is true, add the authorization header using the token from the LoginController
    if (auth) {
      dio.options.headers = {'authorization': authc.token.value};
    }

    try {
      // performing post request
      if (put) {
        response = await dio.put(url, data: data);
      } else {
        response = await dio.post(url, data: data);
      }
    } on Dio.DioError catch (e) {
      // If an error occurs during the request, handled it
      if (e.response != null) {
        // If there is a response from the server, assigned it to the 'response' variable
        response = e.response!;
      } else {
        // If there is no response, created a new response with an error message
        response = Dio.Response(
            requestOptions: Dio.RequestOptions(path: url),
            data: {'status': false, 'message': e.message});
      }
    }

    // Returned the data extracted from the response using the 'getData' function
    return getData(response.data);
  }
}
