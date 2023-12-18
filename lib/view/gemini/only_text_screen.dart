import 'package:flutter/material.dart';
import 'package:google_gemini/google_gemini.dart';

class OnlyChat extends StatefulWidget {
  const OnlyChat({Key? key}) : super(key: key);

  @override
  State<OnlyChat> createState() => _OnlyChatState();
}

class _OnlyChatState extends State<OnlyChat> {
  bool loading = false;
  List textChat = [];
  List textWithImageChat = [];

  final ScrollController _controller = ScrollController();
  static final textController = TextEditingController();
  static final googleGemini = GoogleGemini(apiKey: "AIzaSyDFxsHBgGnT44kS7Of5qSoaCx10B8i9Bkc");

  void scrollToTheEnd(){
    _controller.jumpTo(_controller.position.maxScrollExtent);
  }

  void fromText({required String query}){
    setState(() {
      loading = true;
      textChat.add({
        "role" : "User",
        "text" : query,
      });
      textController.clear();
    });
    scrollToTheEnd();
    googleGemini.generateFromText(query).then((value){
      setState(() {
        loading = false;
        textChat.add({
          "role": "Gemini",
          "text": value.text,
        });
      });
      scrollToTheEnd();
    }).onError((error, stackTrace){
      setState(() {
        loading = false;
        textChat.add({
          "role": "Gemini",
          "text": error.toString(),
        });
      });
      scrollToTheEnd();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _controller,
            itemCount: textChat.length,
            itemBuilder: (context,index){
              return ListTile(
                isThreeLine: true,
                leading: CircleAvatar(
                  child: Text(textChat[index]["role"].substring(0, 1)),
                ),
                title: Text(textChat[index]["role"]),
                subtitle: Text(textChat[index]["text"]),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            controller: textController,
            decoration: InputDecoration(
              hintText: "Enter Your Message",
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                onTap: (){
                  fromText(
                    query: textController.text,
                  );
                },
                child: loading ? CircularProgressIndicator() : Icon(
                  Icons.send,
                  size: 25,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
