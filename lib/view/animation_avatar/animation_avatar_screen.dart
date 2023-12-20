


import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class AnimationAvatar extends StatefulWidget {
  const AnimationAvatar({Key? key}) : super(key: key);

  @override
  State<AnimationAvatar> createState() => _AnimationAvatarState();
}

class _AnimationAvatarState extends State<AnimationAvatar> {

  bool _animate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Avatar"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: AvatarGlow(
              startDelay: const Duration(milliseconds: 1000),
              glowColor: Colors.grey.shade500,
              glowShape: BoxShape.circle,
              animate: _animate,
              curve: Curves.fastOutSlowIn,
              child: Material(
                elevation: 8.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                    radius: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/images/image1.jpg",
                        height: 100,
                      ),
                    )
                ),
              ),
            ),
          ),
          Center(
            child: AvatarGlow(
              startDelay: const Duration(milliseconds: 1000),
              glowColor: Colors.grey.shade500,
              glowShape: BoxShape.rectangle,
              animate: _animate,
              curve: Curves.fastOutSlowIn,
              child: Material(
                elevation: 10.0,
                shape: CircleBorder(),
                child: Image.asset(
                  "assets/images/image1.jpg",
                  height: 100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
