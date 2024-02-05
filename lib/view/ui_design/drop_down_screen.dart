


import 'package:flutter/material.dart';

class DropDownScreen extends StatefulWidget {
  const DropDownScreen({super.key});

  @override
  State<DropDownScreen> createState() => _DropDownScreenState();
}

class _DropDownScreenState extends State<DropDownScreen> {

  bool change = false;

  List sortName = [
    "Sports",
    "News",
    "Cricket",
    "FootBall",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DropDown"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OnTapWidget(
                  title: "Sort",
                  icon: Icons.ac_unit_outlined,
                  color: change ? Colors.red : Colors.black,
                  iconColor: change ? Colors.red : Colors.black,
                  onTap: (){
                    setState(() {
                      if(change == true){
                        change = false;
                      }else{
                        change = true;
                      }
                    });
                  },
                ),
                OnTapWidget(
                  title: "Sort",
                  icon: Icons.ac_unit_outlined,
                  onTap: (){

                  },
                ),
                OnTapWidget(
                  title: "Sort",
                  icon: Icons.ac_unit_outlined,
                  onTap: (){

                  },
                ),
              ],
            ),
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: 50,
                    itemBuilder: (context,index){
                      return Text('Hello $index');
                    },
                  ),
                ),
                change ?
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.grey,
                  child: ListView.builder(
                    itemCount: sortName.length,
                    itemBuilder: (context,index){
                      return ListTile(
                        title: Text(sortName[index]),
                        trailing: Icon(Icons.check),
                      );
                    },
                  ),
                ) :
                SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class OnTapWidget extends StatelessWidget {
  OnTapWidget({ this.color,required this.title,required this.onTap,this.icon,this.iconColor ,super.key});
  String title;
  Color? color;
  Color? iconColor;
  VoidCallback onTap;
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(icon,color: iconColor,),
        ],
      ),
    );
  }
}
