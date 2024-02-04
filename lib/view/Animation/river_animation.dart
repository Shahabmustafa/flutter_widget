import 'package:flutter/material.dart';

class RiveAnimationScreen extends StatefulWidget {
  const RiveAnimationScreen({super.key});

  @override
  State<RiveAnimationScreen> createState() => _RiveAnimationScreenState();
}

class _RiveAnimationScreenState extends State<RiveAnimationScreen> {
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
