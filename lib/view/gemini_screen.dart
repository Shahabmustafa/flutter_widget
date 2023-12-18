

import 'package:flutter/material.dart';
import 'package:flutter_widgets/view/bubble_message.dart';
import 'package:google_gemini/google_gemini.dart';

class GeminiPage extends StatefulWidget {
  const GeminiPage({Key? key}) : super(key: key);

  @override
  State<GeminiPage> createState() => _GeminiPageState();
}

class _GeminiPageState extends State<GeminiPage> {
  List<Map<String,dynamic>> messages = [];
  static final textController = TextEditingController();
  static final googleGemini = GoogleGemini(apiKey: "AIzaSyDFxsHBgGnT44kS7Of5qSoaCx10B8i9Bkc");
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Gemini"),
          centerTitle: true,
          bottom: TabBar(
              tabs: [
                Tab(
                  text: "Text only",
                ),
                Tab(
                  text: "Text with Images",
                ),
              ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Expanded(
                  child: BubbleMessage(
                      messages: messages,
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: "Enter Your Message",
                      border: OutlineInputBorder(),
                      suffixIcon: GestureDetector(
                        onTap: () => geminiText(context,textController.text),
                        child: Icon(
                          Icons.send,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: Column(
                    children: [

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Your Message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: (){

                              },
                              child: Icon(
                                Icons.camera_alt,
                                size: 25,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: (){

                              },
                              child: Icon(
                                Icons.send,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Future geminiText(BuildContext context,String textMessage)async{
    try{
      await googleGemini
          .generateFromText(textMessage)
          .then((value){
        print(value.response.candidates);
        print(value.response.promptFeedback);
        print(value.text);
        print("request sucessfully complete${value.toString()}");
        textController.clear();
      }).onError((error, stackTrace){
        print("request fail ${error.toString()}");
      });
    }catch(e){
      print(e.toString());
    }
  }

}
