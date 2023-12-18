

import 'package:flutter/material.dart';

class BubbleMessage extends StatefulWidget {
  BubbleMessage({Key? key,required this.messages}) : super(key: key);
  final List messages;
  @override
  State<BubbleMessage> createState() => _BubbleMessageState();
}

class _BubbleMessageState extends State<BubbleMessage> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return ListView.separated(
        separatorBuilder: (_,i) => Padding(padding: EdgeInsets.only(top: 10)),
        itemCount: widget.messages.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            child: Row(
              mainAxisAlignment: widget.messages[index]["isUserMessage"] ? MainAxisAlignment.end : MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 14,horizontal: 8),
                  decoration: BoxDecoration(
                    color: widget.messages[index]["isUserMessage"] ? Colors.grey.shade500 : Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: w * 2/3,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                      ),
                      SizedBox(
                        width: w * 0.02,
                      ),
                      Flexible(
                        child: Text(widget.messages[index]["message"].text.text[0],style: TextStyle(
                          color: widget.messages[index]["isUserMessage"] ? Colors.white :  Colors.white,
                        ),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}