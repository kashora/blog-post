// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:blog_poster/View/Main_view.dart';
import 'package:blog_poster/Viewmodel/Main_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
    ),
  );
  runApp(ChangeNotifierProvider(
      create: (context) => MainViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'flutter app',
        debugShowCheckedModeBanner: false,
        home: MainPage(),
        //routes: {
        //'/secondpage': (context) => SecondPage(),
        //'/firstpage': (context) => FirstPage()
        //}
        theme: ThemeData(
            //primaryColor: Colors.blue,
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.purple, primary: Colors.blue
                // ···
                //brightness: Brightness.wh,
                ),

            // Define the default `TextTheme`. Use this to specify the default
            // text styling for headlines, titles, bodies of text, and more.
            textTheme: TextTheme(
              displayLarge: const TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
              ),
              // ···

              //bodyMedium: GoogleFonts.merriweather(),
              //displaySmall: GoogleFonts.pacifico(),
            ),
            appBarTheme: AppBarTheme(
                backgroundColor: const Color.fromARGB(255, 74, 168, 245),
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 25))));
  }
}
