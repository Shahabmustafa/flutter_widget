import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_gemini/google_gemini.dart';

class GeminiApi extends GetxController{


  RxBool loading = false.obs;
  List textChat = [];
  List textWithImageChat = [];

  setLoading(bool value){
    loading.value = value;
  }

  final ScrollController _controller = ScrollController();
  static final textController = TextEditingController();
  static final googleGemini = GoogleGemini(apiKey: "AIzaSyDFxsHBgGnT44kS7Of5qSoaCx10B8i9Bkc");

  void scrollToTheEnd(){
    _controller.jumpTo(_controller.position.maxScrollExtent);
  }

  void fromText({required String query}){
    setLoading(true);
    try{
      textChat.add({
        "role": "User",
        "text": query,
      });
      textController.clear();
      googleGemini.generateFromText(query).then((value){
        setLoading(false);
          textChat.add({
            "role": "Gemini",
            "text": value.text,
          });
        scrollToTheEnd();
      }).onError((error, stackTrace){
        setLoading(false);
        textChat.add({
          "role": "Gemini",
          "text": error.toString(),
        });
        scrollToTheEnd();
      });
    }catch(e){
      setLoading(false);
    }
  }



}