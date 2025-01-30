import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:infotainment/weather/controller/global_controller.dart';
import 'package:infotainment/weather/widgets/weather_block_item.dart';
import 'package:infotainment/weather/widgets/weather_row_item.dart';
import 'package:infotainment/weather/widgets/current_weather_widget.dart';
import 'package:infotainment/weather/widgets/header_widget.dart';
import 'package:infotainment/home_screen/widgets/clock.dart';

class WeatherHomeScreen extends StatefulWidget {
  const WeatherHomeScreen({Key? key}) : super(key: key);

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  //call
  final GlobalController globalController =
  Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Weather',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const Clock(), // Add your Clock widget here
          ],
        ),
        backgroundColor: const Color(0xFFAC3E45), // Sets background color
        elevation: 2, // Adds a shadow for a subtle 3D effect
        iconTheme: IconThemeData(
          color: Colors.white, // Changes back arrow to white
        ),
      ),
      body: SafeArea(
        child: Obx(
              () => globalController.checkLoading().isTrue
              ? const Center(
            child: CircularProgressIndicator(),
          )
              :Center(
  child: Stack(
    children: [
      // Add your ListView
      ListView(
        scrollDirection: Axis.vertical,
      ),
      Positioned(
        top: 0, // Adjust top position
        left: 475, // Adjust left position
        child: Container(
          color: const Color(0xFF228BB9).withOpacity(0.6),
          width: 700,
          height: 800,
        ),
      ),
      Positioned(
        top: 25, // Adjust top position
        left: 560, // Adjust left position
        child: CurrentWeatherBlock(
          number: globalController.getData().getCurrentWeather().current.feelsLike,
          units: "\u00b0",
          text: "Feels Like",
          icon: CupertinoIcons.thermometer,
        ),
      ),
      Positioned(
        top: 25, // Adjust top position
        left: 770, // Adjust left position
        child: CurrentWeatherBlock(
          number: globalController.getData().getCurrentWeather().current.feelsLike, // Fix this value later
          units: "\u0025",
          text: "Rain Chance",
          icon: CupertinoIcons.cloud_drizzle,
        ),
      ),
      Positioned(
        top: 250, // Adjust top position
        left: 525, // Adjust left position
        child: CurrentWeatherRow(
          lowTemp: globalController.getData().getCurrentWeather().current.feelsLike, // Fix this value later
          weekDay: "Saturday",
          highTemp: globalController.getData().getCurrentWeather().current.feelsLike,
          icon: CupertinoIcons.cloud_drizzle,
        ),
      ),
      Positioned(
        top: 350, // Adjust top position
        left: 525, // Adjust left position
        child: CurrentWeatherRow(
          lowTemp: globalController.getData().getCurrentWeather().current.feelsLike, // Fix this value later
          weekDay: "Sunday",
          highTemp: globalController.getData().getCurrentWeather().current.feelsLike,
          icon: CupertinoIcons.cloud_drizzle,
        ),
      ),
      Positioned(
        top: 450, // Adjust top position
        left: 525, // Adjust left position
        child: CurrentWeatherRow(
          lowTemp: globalController.getData().getCurrentWeather().current.feelsLike, // Fix this value later
          weekDay: "Monday",
          highTemp: globalController.getData().getCurrentWeather().current.feelsLike,
          icon: CupertinoIcons.cloud_drizzle,
        ),
      ),
    ],
  ),
)
        )
      )
    );
  }
}