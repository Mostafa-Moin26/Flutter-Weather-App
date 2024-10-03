import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/additional_infoItem.dart';
import 'package:weather_app/api_key.dart';
import 'package:weather_app/hourly_forecast_item.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double temp = 0.0;
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future getCurrentWeather() async {
    try {
      String cityName = 'London';
      final response = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$apiKey'),
      );

      if (response.statusCode != 200) {
        print(
            'Failed to load weather data. Status code: ${response.statusCode}');
        throw 'Failed to load weather data';
      }

      final data = jsonDecode(response.body);

      setState(() {
        temp = data['main']['temp'];
      });
    } catch (e) {
      print('Error: $e'); // Print the actual error for debugging
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // main card
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '$temp K',
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Icon(
                            Icons.cloud,
                            size: 60,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Rain',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Weather Forecast',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // weather forecast card
            const SizedBox(
              height: 15,
            ),

            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastItem(
                      time: '00:00', icon: Icons.cloud, temperature: '301.22'),
                  HourlyForecastItem(
                      time: '03:00', icon: Icons.sunny, temperature: '300.52'),
                  HourlyForecastItem(
                      time: '06:00', icon: Icons.cloud, temperature: '302.22'),
                  HourlyForecastItem(
                      time: '09:00', icon: Icons.sunny, temperature: '300.12'),
                  HourlyForecastItem(
                      time: '12:00', icon: Icons.cloud, temperature: '304.44'),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // additional information card
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Additional Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Humidity
                  AdditionalInfoItem(
                      icon: Icons.water_drop, lebel: 'Humidity', value: '94'),
                  // Wind speed
                  AdditionalInfoItem(
                      icon: Icons.air, lebel: 'Wind Speed', value: '7.67'),
                  // Pressure
                  AdditionalInfoItem(
                      icon: Icons.beach_access,
                      lebel: 'Pressure',
                      value: '1006'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
