import 'package:flutter/material.dart';
import 'screens/plan_manager_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adoption & Travel Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PlanManagerScreen(),
    );
  }
}
