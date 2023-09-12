import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/widgets/tasks.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromARGB(255, 5, 59, 80),
);

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      theme: ThemeData().copyWith(
        brightness: Brightness.light,
        colorScheme: colorScheme,
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme().copyWith(
    titleSmall: GoogleFonts.inter(
      fontWeight: FontWeight.normal,
    ),
    titleMedium: GoogleFonts.inter(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.inter(
      fontWeight: FontWeight.bold,
    ),
    
  ),),
      debugShowCheckedModeBanner: false,
      home: Tasks(),
    ));
  }
}
