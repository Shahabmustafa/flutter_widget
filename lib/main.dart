import 'package:flutter/material.dart';
import 'package:flutter_widgets/view/Animation/container_animation.dart';
import 'package:flutter_widgets/view/Animation/parallax_scrolling_effect.dart';
import 'package:flutter_widgets/view/animation_avatar/animation_avatar_screen.dart';
import 'package:flutter_widgets/view/ui_design/dashboard.dart';
import 'package:flutter_widgets/view/ui_design/home_screen.dart';

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
      home: ParellaxScrollingEffect(),
    );
  }
}
