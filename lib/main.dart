//import 'package:exercise_state/layouts/alignm.dart';

import 'package:flutter/material.dart';
import "package:flutter/services.dart";
import 'package:exercise_state/widgets/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125));
void main() {
     runApp(MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
            color: kDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData(fontFamily: "Oswald").copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),

        //scaffoldBackgroundColor: Color.fromARGB(255,220,189,252),
      ),
      home: const Expenses(),
    ));
  
}





//locking the screen not to rotate 
 //WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setPreferredOrientations([
    //DeviceOrientation.portraitUp,
  //]).then((fn) {

// const Expenses()

//things to do
//use flutter pub add intl : to get the package use it in the model
