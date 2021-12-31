import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WEATHER',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(
        darkMode: darkMode,
        modeChange: _toggleMode,
      ),
    );
  }

  _toggleMode() {
    setState(() {
      darkMode = !darkMode;
    });
  }
}
