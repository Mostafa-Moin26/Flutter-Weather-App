import 'package:flutter/material.dart';

class AdditionalInformation extends StatelessWidget {
  const AdditionalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Humidity
        Column(
          children: [
            Icon(
              Icons.opacity,
              size: 42,
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              'Humidity',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '94',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),

        // Wind speeed
        Column(
          children: [
            Icon(
              Icons.air,
              size: 42,
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              'Wind Speed',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '7.67',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),

        // Pressure
        Column(
          children: [
            Icon(
              Icons.speed,
              size: 42,
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              'Pressure',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '1006',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ],
    );
  }
}
