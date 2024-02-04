import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiAnimationScreen extends StatefulWidget {
  const ConfettiAnimationScreen({super.key});

  @override
  State<ConfettiAnimationScreen> createState() => _ConfettiAnimationScreenState();
}

class _ConfettiAnimationScreenState extends State<ConfettiAnimationScreen> {

  bool isPlaying = false;

  final controller = ConfettiController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener((){
      isPlaying = controller.state == ConfettiControllerState.playing;
    });
  }
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                    onPressed: (){
                      if(isPlaying){
                        controller.stop();
                        setState(() {

                        });
                      }else{
                        controller.play();
                        setState(() {

                        });
                      }
                    },
                  child: Text(isPlaying ? "Stop" : "Start New Position"),
                ),
              ),
            ],
          ),
        ),
        ConfettiWidget(
          confettiController: controller,
          shouldLoop: true,
          blastDirection: pi,
          numberOfParticles: 10,
          // emissionFrequency: 0.10,
          maxBlastForce: 20,
          // createParticlePath: (size){
          //   final path = Path();
          //   path.addOval(Rect.fromCircle(center: Offset.fromDirection(20.0), radius: 10));
          //   return path;
          // },
        )
      ],
    );
  }
}
