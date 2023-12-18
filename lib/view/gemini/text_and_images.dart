import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_gemini/google_gemini.dart';
import 'package:image_picker/image_picker.dart';

class TextAndImages extends StatefulWidget {
  const TextAndImages({Key? key}) : super(key: key);

  @override
  State<TextAndImages> createState() => _TextAndImagesState();
}

class _TextAndImagesState extends State<TextAndImages> {

  ImagePicker imagePicker = ImagePicker();
  bool loading = false;
  List textAndImageChat = [];
  List textWithImageChat = [];
  File? imageFile;

  TextEditingController textController = TextEditingController();

  final ScrollController _controller = ScrollController();

  static final googleGemini = GoogleGemini(apiKey: "AIzaSyDFxsHBgGnT44kS7Of5qSoaCx10B8i9Bkc");

  void scrollToTheEnd(){
    _controller.jumpTo(_controller.position.maxScrollExtent);
  }

  void fromTextAndImage({required String query,required File image}) {
    setState(() {
      loading = true;
      textAndImageChat.add({
        "role": "User",
        "text": query,
        "image": image,
      });
      textController.clear();
    });
    scrollToTheEnd();
    googleGemini.generateFromTextAndImages(
        query: query,
        image: image
    ).then((value) {
      setState(() {
        loading = false;
        textAndImageChat.add({
          "role": "Gemini",
          "text": value.text,
          "image": "",
        });
        textController.clear();
      });
      scrollToTheEnd();
    }).onError((error, stackTrace){
      setState(() {
        loading = false;
        textAndImageChat.add({
          "role": "Gemini",
          "text": error.toString(),
          "image": "",
        });
        textController.clear();
      });
      scrollToTheEnd();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: textAndImageChat.length,
              itemBuilder: (context,index){
                return ListTile(
                  isThreeLine: true,
                  leading: CircleAvatar(
                    child: Text(textAndImageChat[index]["role"].substring(0, 1)),
                  ),
                  title: Text(textAndImageChat[index]["role"]),
                  subtitle: Text(textAndImageChat[index]["text"]),
                  trailing: textAndImageChat[index]["image"] == ""
                      ? null
                      : Image.file(textAndImageChat[index]["image"], width: 90,),
                );
              },
            )
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: textController,
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
                        onTap: ()async{
                          final ImagePicker picker = ImagePicker();

                          final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                          setState(() {
                            imageFile = (image != null ? File(image.path) : null);
                          });
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
                          if(textController.text.isEmpty){
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Please Enter Your Question"))
                            );
                          }else if(imageFile == null){
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Please select an image"))
                            );
                          }else{
                            fromTextAndImage(query: textController.text, image: imageFile!);
                          }
                        },
                        child: loading ? CircularProgressIndicator() : Icon(
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
      floatingActionButton: imageFile != null ? Container(
        margin: const EdgeInsets.only(bottom: 80),
        height: 100,
        width: 100,
        child: Image.file(imageFile ?? File("")),
      ): null,
    );
  }
}
