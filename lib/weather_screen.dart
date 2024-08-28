import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

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
      body: const Column(
        children: [
          // main card
          Placeholder(
            fallbackHeight: 250,
          ),
          SizedBox(
            height: 20,
          ),

          // weather forecast card
          Placeholder(
            fallbackHeight: 150,
          ),
          SizedBox(
            height: 20,
          ),

          // additional information card
          Placeholder(
            fallbackHeight: 150,
          )
        ],
      ),
    );
  }
}
