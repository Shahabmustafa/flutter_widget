


import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveAnimation extends StatefulWidget {
  const RiveAnimation({super.key});

  @override
  State<RiveAnimation> createState() => _RiveAnimationState();
}

class _RiveAnimationState extends State<RiveAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Expanded(

            // child: RiveAnimation.network("https://cdn.rive.app/animations/vehicles.riv")
          // )
        ],
      ),
    );
  }
}
