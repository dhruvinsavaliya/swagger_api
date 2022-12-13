import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swagger_api/view/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Keep Notes',

          home: HomeScreen(),
        ),
    );
  }
}
