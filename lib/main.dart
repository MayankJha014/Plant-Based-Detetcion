import 'package:flutter/material.dart';
import 'package:plant_based_detection/splash_screen.dart';

void main() {
  runApp(const PlantBasedDetetcion());
}

class PlantBasedDetetcion extends StatefulWidget {
  const PlantBasedDetetcion({super.key});

  @override
  State<PlantBasedDetetcion> createState() => _PlantBasedDetetcionState();
}

class _PlantBasedDetetcionState extends State<PlantBasedDetetcion> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      themeMode: ThemeMode.dark,
    );
  }
}
