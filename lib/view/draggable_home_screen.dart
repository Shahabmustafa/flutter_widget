


import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';

class DraggableHomePage extends StatefulWidget {
  const DraggableHomePage({Key? key}) : super(key: key);

  @override
  State<DraggableHomePage> createState() => _DraggableHomePageState();
}

class _DraggableHomePageState extends State<DraggableHomePage> {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("Phone",style: TextStyle(color: Colors.white),),
      centerTitle: false,
      actions: [
        Icon(Icons.add,color: Colors.white,),
        SizedBox(
          width: 10,
        ),
        Icon(Icons.search,color: Colors.white,),
        SizedBox(
          width: 10,
        ),
        Icon(Icons.more_vert,color: Colors.white,),
      ],
      headerWidget: headerWidget(context),
      headerBottomBar: headerBottomBarWidget(context),
      body: [ListViewBuilderWidget(context),],
      fullyStretchable: true,
      backgroundColor: Colors.white,
      appBarColor: Colors.black,
    );
  }
}

Row headerBottomBarWidget(BuildContext context){
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(Icons.add,color: Colors.white,),
      SizedBox(
        width: 10,
      ),
      Icon(Icons.search,color: Colors.white,),
      SizedBox(
        width: 10,
      ),
      Icon(Icons.more_vert,color: Colors.white,),
    ],
  );
}

Widget headerWidget(BuildContext context) {
  return Container(
    color: Colors.black,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Phone",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.white70),
        ),
        Text("9 Contact with Phone Number",style: TextStyle(color: Colors.white),)
      ],
    ),
  );
}


ListView ListViewBuilderWidget(BuildContext context){
  List<String> phoneNumber = [
    "0312*******",
    "0347*******",
    "0323*******",
    "0315*******",
    "0314*******",
    "0305*******",
    "0306*******",
    "0316*******",
    "0316*******",
  ];
  List<String> phoneName = [
    "Shahab Mustafa",
    "Sheraz Mustafa",
    "Bilal Mustafa",
    "Aftab Mustafa",
    "Kashif Mustafa",
    "Muhammad Umar",
    "Hashim Khan",
    "Qasim Khan",
    "Sabir Khan",
  ];
  List<String> phoneAvatar = [
    "A",
    "B",
    "S",
    "S",
    "S",
    "Q",
    "H",
    "M",
    "K",
  ];
  phoneName.sort();
  phoneNumber.sort();
  phoneAvatar.sort();
  return ListView.builder(
      padding: const EdgeInsets.only(top: 0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 9,
      itemBuilder: (context,index){
        return ListTile(
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(50)
            ),
            child: Center(child: Text(phoneAvatar[index],style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),),
          ),
          title: Text(phoneName[index]),
          subtitle: Text(phoneNumber[index]),
        );
      }
  );
}