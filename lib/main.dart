import 'package:azure_car/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          fontFamily: 'Evolve',
          brightness: Brightness.light,
          focusColor: const Color.fromRGBO(139, 139, 139, 1),
        ),
        home: const Splash(),
      );
    });
  }
}
