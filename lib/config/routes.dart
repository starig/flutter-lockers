import 'package:flutter/material.dart';
import 'package:lockers/initial.dart';
import 'package:lockers/screens/home_screen.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  '/': (context) => const InitialScreen(),
  '/home': ((context) => const HomeScreen()),
};
