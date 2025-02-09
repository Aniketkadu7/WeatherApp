import 'package:flutter/material.dart';

class WeatherAppPage extends StatefulWidget {
  const WeatherAppPage({super.key});

  @override
  State<WeatherAppPage> createState() => _WeatherAppPageState();
}

class _WeatherAppPageState extends State<WeatherAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        
        ),
        centerTitle: true,

        actions: [
          IconButton(onPressed: () { print("refresh");}, icon: Icon(Icons.refresh))
        ],
        
      ),

    );
  }
}