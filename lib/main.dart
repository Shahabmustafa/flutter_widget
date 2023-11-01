import 'package:flutter/material.dart';
import 'package:flutter_widgets/view/audio_music.dart';
import 'package:flutter_widgets/view/draggable_home_screen.dart';
import 'package:flutter_widgets/view/gap_screen.dart';

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
      home: GapPage(),
    );
  }
}
