import 'dart:ui';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // main card
            SizedBox(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                ),
                elevation: 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text("300°K", 
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                          ),
                          Icon(Icons.cloud, size: 64),
                          Text("Rain",
                          style: TextStyle(
                            fontSize: 20
                          ),)
                      
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: const Text("Weather Forecast", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              
              ),
              ),
            ),

            SizedBox(
              height: 15,
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastItem(
                    time: "03:00",
                    value: "301.73",
                  ),
                  HourlyForecastItem(
                    time: "06:00",
                    value: "301.73",
                  ),
                  HourlyForecastItem(
                    time: "09:00",
                    value: "301.73",
                  ),
                  HourlyForecastItem(
                    time: "12:00",
                    value: "301.73",
                  ),
                  HourlyForecastItem(
                    time: "15:00",
                    value: "301.73",
                  ),
                  
                ],
              
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // Additional Information

            Align(
              alignment: Alignment.centerLeft,
              child: const Text("Additional Information", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              
              ),
              ),
            ),
            SizedBox(height: 15,),

            Row(
              children: [
                AdditionalInfoItem(
                  icon: Icons.water_drop,
                  label: "Humidity",
                  value: "94",
                ),
                AdditionalInfoItem(
                  icon: Icons.air,
                  label: "Wind speed",
                  value: "7.684",
                ),
                AdditionalInfoItem(
                  icon: Icons.water_drop,
                  label: "Pressure",
                  value: "1002",
                ),

                
                
              ],
            ),

        
            
            
        
            
            
          ],
        ),
      ),

    );
  }
}

class AdditionalInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const AdditionalInfoItem({
    required this.icon,
    required this.label,
    required this.value,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Icon(icon,
            size: 36,),
        
            SizedBox(height: 10,),
        
            Text(label, style: TextStyle(
              fontSize: 16
            ),),
            SizedBox(height: 8,),
        
            Text(value, style: TextStyle(
              fontSize: 16
            ),)
          ],
        
        
        ),
      ),
    );
  }
}

class HourlyForecastItem extends StatelessWidget {
  final String time;
  final String value;
  const HourlyForecastItem({
    required this.time,
    required this.value,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                    width: 110,
                    child: Card(
                      elevation: 6,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                             children: [
                              Text(time, style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),),
                              SizedBox(height: 10,),
                              Icon(Icons.cloud,
                              size: 36,),
                              SizedBox(height: 10,),
                              Text(value),
                          
                             ],
                          ),
                        ),
                      ),
                    ),
                  );
  }
}