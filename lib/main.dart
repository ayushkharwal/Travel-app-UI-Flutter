import 'package:building/cubit/app_cubit_logics.dart';
import 'package:building/cubit/cubit.dart';
import 'package:building/pages/detailed_page.dart';
import 'package:building/pages/nav_pages/main_page.dart';
import 'package:building/pages/welcome_page.dart';
import 'package:building/services/data_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'GoogleFonts.oswald()',
      ),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(
          data: DataServices(),
        ),
        child: AppCubitLogics(),
      ),
    );
  }
}
