import 'package:flutter/material.dart';

final kDefaultTheme = ThemeData(
    primarySwatch: Colors.blue,
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(fontSize: 20),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            side: const BorderSide(color: Colors.white),
            minimumSize: const Size(50, 50))),
    appBarTheme: const AppBarTheme(
      elevation: 10,
      backgroundColor: Color(0xFF00B0F0),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black87,
        backgroundColor: Colors.white,
        textStyle:const TextStyle(fontSize: 18)
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(10),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return const Color(0xFF00B0F0).withOpacity(0.5);
                }
                return const Color(0xFFCDF0FC);
              },
            ),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            shape:
                MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.all(20)))));
