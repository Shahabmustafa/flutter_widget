import 'package:flutter/material.dart';
import 'package:flutter_widgets/view/gemini/only_text_screen.dart';
import 'package:flutter_widgets/view/gemini/text_and_images.dart';

class GeminiPage extends StatefulWidget {
  const GeminiPage({Key? key}) : super(key: key);

  @override
  State<GeminiPage> createState() => _GeminiPageState();
}

class _GeminiPageState extends State<GeminiPage> {

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
            OnlyChat(),
            TextAndImages(),
          ],
        ),
      ),
    );
  }
}
