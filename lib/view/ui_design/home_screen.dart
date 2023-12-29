import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/view/ui_design/card_screen.dart';
import 'package:flutter_widgets/view/ui_design/dashboard.dart';
import 'package:flutter_widgets/view/ui_design/transaction.dart';



class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {

  int pageIndex = 0;

  List PageIndex = [
    DashboardPage(),
    TransactionScreen(),
    CardScreen(),
    Text("Static"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageIndex[pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: pageIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: (index){
          setState(() {
            pageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
            activeIcon: Icon(Icons.home_filled)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cached_sharp),
            label: "Transaction",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.creditcard,),
            label: "Card",
            activeIcon: Icon(CupertinoIcons.creditcard,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Setting",
              activeIcon: Icon(Icons.settings)
          ),
        ],
      ),
    );
  }
}
