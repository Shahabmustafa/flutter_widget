import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  static var date = DateTime.timestamp();
  static var hour = date.hour;
  static var minute = date.minute;
  var time = "${hour} : ${minute}";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, SHAHAB",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          "Welcome",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.8),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: Icon(
                            Icons.person,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.notifications_none,
                          size: 30,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                       children: [
                         Padding(
                           padding: EdgeInsets.only(left: 10,top: 10),
                           child: Row(
                             children: [
                               Text(
                                 "Current Balance",
                                 style: TextStyle(
                                   color: Colors.grey.shade300,
                                   fontSize: 17,
                                   fontWeight: FontWeight.w500,
                                 ),
                               ),
                             ],
                           ),
                         ),
                         Padding(
                           padding: EdgeInsets.only(left: 10,top: 10),
                           child: Row(
                             children: [
                               Text(
                                 "Rs 45,900",
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 25,
                                   fontWeight: FontWeight.w500,
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_circle_outline_sharp),
                                  Text("Add Tip")
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.near_me_outlined),
                                  Text("Send")
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(CupertinoIcons.share),
                                  Text("Send")
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                        "Other Service",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/icons/netflix.png",
                                height: 40,
                                width: 40,
                              ),
                              Text(
                                "Netflix",
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/icons/microsoft.png",
                                height: 40,
                                width: 40,
                              ),
                              Text(
                                "Microsoft",
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/icons/logo.png",
                                height: 40,
                                width: 40,
                              ),
                              Text(
                                "Amazon Pay",
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/icons/google-pay.png",
                                height: 40,
                                width: 40,
                              ),
                              Text(
                                "Google Pay",
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/icons/paypal.png",
                                height: 40,
                                width: 40,
                              ),
                              Text(
                                "PayPal",
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/icons/stripe.png",
                                height: 40,
                                width: 40,
                              ),
                              Text(
                                "Stripe",
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/icons/shopping.png",
                                height: 40,
                                width: 40,
                              ),
                              Text(
                                "Credit Card",
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(Icons.add_circle_outline_outlined),
                              ),
                              Text(
                                "Other",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Transaction",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context,index){
                      return ListTile(
                        leading: Image.asset("assets/images/icons/paypal.png",height: 30,width: 30,),
                        title: Text("Paypal"),
                        subtitle: Text(time.toString()),
                        trailing: Text(
                            "Rs 240",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
