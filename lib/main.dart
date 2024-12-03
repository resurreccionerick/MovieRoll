import 'package:flutter/material.dart';
import 'package:movie_roll/Screen/MovieListScreen.dart';

import 'locator/locator.dart';

void main() {
  // Set up dependency injection
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Roll',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: MovielistScreen(),
    );
  }
}
