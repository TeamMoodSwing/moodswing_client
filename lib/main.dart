import 'package:flutter/material.dart';
import 'package:moodswing_client/presentation/common/view/home_screen.dart';
import 'package:moodswing_client/presentation/common/view/splash_screen.dart';
import 'package:moodswing_client/presentation/signin/view/signin_screen.dart';
import 'package:moodswing_client/presentation/signin/view/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'NotoSans'),
        debugShowCheckedModeBanner: false,
        home: SignInScreen());
  }
}
