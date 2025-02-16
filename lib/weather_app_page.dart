import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secrets.dart';

class WeatherAppPage extends StatefulWidget {
  const WeatherAppPage({super.key});

  @override
  State<WeatherAppPage> createState() => _WeatherAppPageState();
}

class _WeatherAppPageState extends State<WeatherAppPage> {

  
    Future<Map<String,dynamic>> getCurrentWeather() async {
    try{
        final city = "Pune";
      final res =  await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/forecast?q=$city&APPID=$API_KEY"));

      final data = jsonDecode(res.body);
      if(data['cod']!='200'){
        throw "an unexpected error occured";
      }
      return data;

      
    }catch(e){
      throw e.toString();
    }
    
   
  }
  
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
          IconButton(onPressed: ( ) {setState(() {
            
          }); }, icon: Icon(Icons.refresh))
        ],
        
      ),
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator.adaptive());
          }

          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }

          final data = snapshot.data!;
          final currentTemp = data['list'][0]['main']['temp'];
          final currSky = data['list'][0]['weather'][0]['main'];
          final currweatherData = data['list'][0]['main'];
          final pressure = currweatherData['pressure'];
          final humidity = currweatherData['humidity'];
          final windspeed = data['list'][0]['wind']['speed'];
          return Padding(
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
                            Text("$currentTemp K", 
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                            ),
                            Icon(currSky=="Clouds" || currSky=="Rain" ?  Icons.cloud : Icons.sunny, size: 64),
                            Text(currSky,
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
        
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //       for(int i=0; i<38; i++)
              //         HourlyForecastItem(
              //         time: data['list'][i+1]['dt'].toString(),
              //         icon : data['list'][i+1]['weather'][0]['main']=="Clouds" || data['list'][i+1]['weather'][0]['main']=="Rain" ? Icons.cloud : Icons.sunny,
              //         value: data['list'][i+1]['main']['temp'].toString(),
              //        ),
                    
                    
              //     ],
                
              //   ),
              // ),

              SizedBox(
                height: 130,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  
                  itemBuilder: (context, index) {
                    final time = DateTime.parse(data['list'][index+1]['dt_txt']);
                    return HourlyForecastItem(
                      time: DateFormat.j().format(time),
                      value: data['list'][index+1]['main']['temp'].toString(),
                      icon: data['list'][index+1]['weather'][0]['main']=="Clouds" || data['list'][index+1]['weather'][0]['main']=="Rain" ? Icons.cloud : Icons.sunny,
                    );
                  },
                
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
                    value: humidity.toString(),
                  ),
                  AdditionalInfoItem(
                    icon: Icons.air,
                    label: "Wind speed",
                    value: windspeed.toString(),
                  ),
                  AdditionalInfoItem(
                    icon: Icons.water_drop,
                    label: "Pressure",
                    value: pressure.toString(),
                  ),
        
                  
                  
                ],
              ),
        
          
              
              
          
              
              
            ],
          ),
        );
        },
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
  final IconData icon;
  const HourlyForecastItem({
    required this.time,
    required this.value,
    required this.icon,
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
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 1,),
                              SizedBox(height: 10,),
                              Icon(icon,
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