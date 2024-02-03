import 'package:flutter/material.dart';

class ParellaxScrollingEffect extends StatefulWidget {
  const ParellaxScrollingEffect({super.key});

  @override
  State<ParellaxScrollingEffect> createState() => _ParellaxScrollingEffectState();
}

class _ParellaxScrollingEffectState extends State<ParellaxScrollingEffect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context,index){
          return ItemWidgets(index: index,);
        },
      )
    );
  }
}


class ItemWidgets extends StatelessWidget {
  ItemWidgets({required this.index,super.key});
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
      height: 220,
      child: Flow(
        delegate: Paralla,
        children: [
          Image.network(
            "https://source.unsplash.com/random/300x800?sig=$index",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate{
  ParallaxFlowDelegate();

  @override
  BoxConstraints getContainersForChild(int i,BoxConstraints constraints){}

  @override
  void paintChildren(FlowPaintingContext context){}



}
