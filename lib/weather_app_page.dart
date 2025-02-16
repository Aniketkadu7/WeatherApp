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
                  SizedBox(
                    width: 110,
                    child: Card(
                      elevation: 6,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                             children: [
                              const Text("03:00", style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),),
                              SizedBox(height: 10,),
                              Icon(Icons.cloud,
                              size: 32,),
                              SizedBox(height: 10,),
                              const Text("301.17"),
                          
                             ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 110,
                    child: Card(
                      elevation: 6,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                             children: [
                              const Text("03:00", style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),),
                              SizedBox(height: 10,),
                              Icon(Icons.cloud,
                              size: 32,),
                              SizedBox(height: 10,),
                              const Text("301.17"),
                          
                             ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 110,
                    child: Card(
                      elevation: 6,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                             children: [
                              const Text("03:00", style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),),
                              SizedBox(height: 10,),
                              Icon(Icons.cloud,
                              size: 32,),
                              SizedBox(height: 10,),
                              const Text("301.17"),
                          
                             ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 110,
                    child: Card(
                      elevation: 6,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                             children: [
                              const Text("03:00", style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),),
                              SizedBox(height: 10,),
                              Icon(Icons.cloud,
                              size: 32,),
                              SizedBox(height: 10,),
                              const Text("301.17"),
                          
                             ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 110,
                    child: Card(
                      elevation: 6,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                             children: [
                              const Text("03:00", style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),),
                              SizedBox(height: 10,),
                              Icon(Icons.cloud,
                              size: 32,),
                              SizedBox(height: 10,),
                              const Text("301.17"),
                          
                             ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              
              ),
            ),
        
            //weather forecast cards
            const Placeholder(
              fallbackHeight: 200,
            ),
        
            // Additional Information
            const Placeholder(
              fallbackHeight: 150,
            )
          ],
        ),
      ),

    );
  }
}