import 'package:flutter/material.dart';

import 'confetti_animation.dart';

class HeroAnimAtionScreen extends StatefulWidget {
  const HeroAnimAtionScreen({super.key});

  @override
  State<HeroAnimAtionScreen> createState() => _HeroAnimAtionScreenState();
}

class _HeroAnimAtionScreenState extends State<HeroAnimAtionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Page2()));
            },
            child: Hero(
              tag: "image2",
              child: Image.network(
                "https://i.pinimg.com/474x/39/ef/11/39ef11553f178bd63ad814fbe86a3386.jpg",
                height: 200,
                width: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HeroAnimAtionScreen()));
        },
        child: Hero(
          tag: "image2",
          child: Image.network(
            "https://i.pinimg.com/474x/39/ef/11/39ef11553f178bd63ad814fbe86a3386.jpg",
          ),
        ),
      ),
    );
  }
}

