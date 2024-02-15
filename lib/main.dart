import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, String> forecast = {
    "name": "today",
    "temperature": "35",
    "shortForecast": "Snowy",
    "detailedForecast": "Snowy all day",
    "windSpeed": "10",
    "windDirection": "SE",
    "isDaytime": "true",
    "probabilityOfPercipitation": "100"
  };

  Map<String, String> location = {
    "city": "Bend",
    "state": "Oregon",
    "zip": "97702"
  };

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return WeatherLayout(location: location, forecast: forecast);
  }
}

class WeatherLayout extends StatelessWidget {
  const WeatherLayout({
    super.key,
    required this.location,
    required this.forecast,
  });

  final Map<String, String> location;
  final Map<String, String> forecast;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                    children: [
                      Location(location: location),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Forecast(forecast: forecast),
                      ),
                    ],
                  ),
            )));
  }
}

class Location extends StatelessWidget {
  const Location({
    super.key,
    required this.location,
  });

  final Map<String, String> location;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: <Widget>[
      Text("${location["city"]!} ", style: textStyle()),
      Text("${location["state"]!} ", style: textStyle()),
      Text("${location["zip"]!}", style: textStyle())
    ]);
  }

  TextStyle textStyle() => TextStyle(fontSize: 30);
}

class Forecast extends StatelessWidget {
  const Forecast({super.key, required this.forecast});
  final Map<String, String> forecast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Temperature: ${forecast['temperature']}", style: textStyle()),
        Text("Short Forecast: ${forecast['shortForecast']}",
            style: textStyle()),
        Text("Detailed Forecast:  ${forecast['detailedForecast']}",
            style: textStyle()),
        Text("Wind Speed:   ${forecast['windSpeed']}", style: textStyle()),
        Text("Wind Direction: ${forecast['windDirection']}",
            style: textStyle()),
        Text("Is Daytime: ${forecast['isDaytime']}", style: textStyle()),
        Text(
            "Probability of Percipitation: ${forecast['probabilityOfPercipitation']}",
            style: textStyle()),
      ],
    );
  }

  TextStyle textStyle() => TextStyle(fontSize: 20);
}
