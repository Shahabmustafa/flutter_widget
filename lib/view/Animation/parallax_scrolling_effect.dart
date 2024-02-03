import 'package:flutter/material.dart';

class ParellaxScrollingEffectScreen extends StatefulWidget {
  const ParellaxScrollingEffectScreen({super.key});

  @override
  State<ParellaxScrollingEffectScreen> createState() => _ParellaxScrollingEffectScreenState();
}

class _ParellaxScrollingEffectScreenState extends State<ParellaxScrollingEffectScreen> {
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
  final keyImage = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
      height: 220,
      child: Flow(
        delegate: ParallaxFlowDelegate(
          scrollable: Scrollable.of(context)!,
          itemContext: context,
          keyImage: keyImage,
        ),
        children: [
          Image.network(
            "https://source.unsplash.com/random/300x800?sig=$index",
            fit: BoxFit.cover,
            key: keyImage,
          ),
        ],
      ),
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate{

  ScrollableState scrollable;
  BuildContext itemContext;
  GlobalKey keyImage;


  ParallaxFlowDelegate({
    required this.scrollable,
    required this.itemContext,
    required this.keyImage,
  }) : super(repaint: scrollable.position);

  @override
  BoxConstraints getContainersForChild(int i,BoxConstraints constraints) =>
      BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );


  @override
  void paintChildren(FlowPaintingContext context){
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final itemBox = itemContext.findRenderObject() as RenderBox;
    final itemOffSet = itemBox.localToGlobal(
      itemBox.size.centerLeft(Offset.zero),
      ancestor: scrollableBox,
    );

    final viewportDimension = scrollable.position.viewportDimension;
    final scrollableFraction = (itemOffSet.dy / viewportDimension).clamp(0, 1);

    final verticalAlignment = Alignment(0, scrollableFraction * 2 - 1);

    final imageBox = keyImage.currentContext!.findRenderObject() as RenderBox;
    final childRect = verticalAlignment.inscribe(
      imageBox.size,
      Offset.zero & context.size,
    );

    context.paintChild(
      0,
      transform: Transform.translate(offset: Offset(0,childRect.top)
      ).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) =>
      scrollable != oldDelegate.scrollable || itemContext != oldDelegate.itemContext || keyImage != oldDelegate.keyImage;

}


