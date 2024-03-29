import 'package:flutter/material.dart';
import 'package:movie_app_ca/core/services/service_locator.dart';
import 'package:movie_app_ca/movies/presentation/screens/movies_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff121312)
      ),
      home:const MoviesScreen()
    );
  }

}
