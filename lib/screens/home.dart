import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_experiment/controllers/user_controller.dart';

class HomeScreen extends StatelessWidget {
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Obx(
            () => userController.isDataLoading.value
            ? Center(child: CircularProgressIndicator())
            : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Location:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 8.0),
              Text('Longitude: ${userController.userData.value.longitude}'),
              Text('Latitude: ${userController.userData.value.latitude}'),
              Text('Generation Time: ${userController.userData.value.generationtimeMs}'),
              Text('UTC Offset Seconds: ${userController.userData.value.utcOffsetSeconds}'),
              Text('Timezone: ${userController.userData.value.timezone}'),
              Text('Timezone Abbreviation: ${userController.userData.value.timezoneAbbreviation}'),
              Text('Elevation: ${userController.userData.value.elevation}'),
              SizedBox(height: 24.0),

              Text(
                'Current Weather:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 8.0),
              Text('Temperature: ${userController.userData.value.currentWeather!.temperature}'),
              Text('Wind Speed: ${userController.userData.value.currentWeather!.windspeed}'),
              Text('Wind Direction: ${userController.userData.value.currentWeather!.winddirection}'),
              Text('Weather Code: ${userController.userData.value.currentWeather!.weathercode}'),
              Text('Day: ${userController.userData.value.currentWeather!.isDay}'),
              Text('Time: ${userController.userData.value.currentWeather!.time}'),
              SizedBox(height: 24.0),

              //Unit display

              // Text(
              //   'Hourly Units:',
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 20,
              //   ),
              // ),
              // SizedBox(height: 8.0),
              // Text('Time: ${userController.userData.value.hourlyUnits!.time}'),
              // Text('Temperature: ${userController.userData.value.hourlyUnits!.temperature2m}'),
              // Text('Relative Humidity: ${userController.userData.value.hourlyUnits!.relativehumidity2m}'),
              // Text('Wind Speed: ${userController.userData.value.hourlyUnits!.windspeed10m}'),
            ],
          ),
        ),
      ),
    );
  }
}
