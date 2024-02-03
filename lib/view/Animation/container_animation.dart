import 'dart:math';

import 'package:flutter/material.dart';

class ContainerAnimation extends StatefulWidget {
  const ContainerAnimation({super.key});

  @override
  State<ContainerAnimation> createState() => _ContainerAnimationState();
}

class _ContainerAnimationState extends State<ContainerAnimation> {

  BorderRadius borderRadius = BorderRadius.circular(10);
  Color color = Colors.red;
  double boxHeight = 100;
  double boxWidth = 100;
  final random = Random();

  void _changeBoxSize(){
    setState(() {
      boxWidth = random.nextInt(400).toDouble();
    });
  }

  void _changeBoxColor(){
    setState(() {
      color = Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    });
  }

  void _changeBoxBorderRadius(){
    setState(() {
      borderRadius = BorderRadius.circular(random.nextInt(80).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 3),
          curve: Curves.bounceIn,
          width: boxHeight,
          height: boxWidth,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: color,
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () => _changeBoxSize(),
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () => _changeBoxColor(),
            icon: Icon(Icons.color_lens),
          ),
          IconButton(
            onPressed: () => _changeBoxBorderRadius(),
            icon: Icon(Icons.blur_circular),
          )
        ],
      ),
    );
  }
}
