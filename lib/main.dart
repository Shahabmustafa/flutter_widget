import 'package:flutter/material.dart';
import 'package:flutter_widgets/view/Animation/confetti_animation.dart';
import 'package:flutter_widgets/view/Animation/parallax_scrolling_effect.dart';
import 'package:flutter_widgets/view/Animation/river_animation.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ConfettiAnimationScreen(),
    );
  }
}
