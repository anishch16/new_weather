import 'dart:convert';
import 'package:api_experiment/model/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {

  var userData=UserModel().obs;
  var isDataLoading = true.obs;

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }


  Future<void> getUsers() async {
    var response = await http.get(
      Uri.parse('https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current_weather=true&hourly=temperature_2m,relativehumidity_2m,windspeed_10m'),
    );
    print("response:::"+response.body);

    if (response.statusCode == 200) {
      UserModel userModel =
      UserModel.fromJson(jsonDecode(response.body));
      userData.value = UserModel(
          latitude: userModel.latitude,
          longitude: userModel.longitude,
          generationtimeMs: userModel.generationtimeMs,
          utcOffsetSeconds: userModel.utcOffsetSeconds,
          timezone: userModel.timezone,
          timezoneAbbreviation: userModel.timezoneAbbreviation,
          elevation: userModel.elevation,
          currentWeather: userModel.currentWeather,
          hourlyUnits: userModel.hourlyUnits,
      );
      isDataLoading.value = false;
    } else {
      // Error response code
      Get.snackbar(
        'Error',
        'Error loading',
        duration: const Duration(seconds: 1),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}