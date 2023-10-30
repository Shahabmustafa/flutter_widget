import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class AudioMusic extends StatefulWidget {
  AudioMusic({Key? key,required this.musicsName,required this.musicsImage,required this.musicsURL}) : super(key: key);
  String musicsImage;
  String musicsName;
  String musicsURL;

  @override
  State<AudioMusic> createState() => _AudioMusicState();
}

class _AudioMusicState extends State<AudioMusic> {

  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player.onPlayerStateChanged.listen((state){
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    player.onDurationChanged.listen((newDuration){
      setState(() {
        duration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition){
      setState(() {
        position = newPosition;
      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.musicsName),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(widget.musicsImage,),
          Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value)async{
                final position = Duration(seconds: value.toInt());
                await player.seek(position);
                await player.resume();
              }
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatTime(duration)),
                Text(formatTime(duration - position)),
              ],
            ),
          ),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            onPressed: ()async{
              if(isPlaying){
                await player.pause();
              }else{
                await player.play(
                  AssetSource(widget.musicsURL),
                );
              }
            },
            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
          ),
        ],
      )
    );
  }
  String formatTime(Duration duration){
    String twoDigits(int n) => n.toString().padLeft(2,'0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final second = twoDigits(duration.inSeconds.remainder(60));
    return [
      if(duration.inHours > 0)
        hours,
      minutes,
      second,
    ].join(':');
  }
}


class SelectMusics extends StatefulWidget {
  const SelectMusics({Key? key}) : super(key: key);

  @override
  State<SelectMusics> createState() => _SelectMusicsState();
}

class _SelectMusicsState extends State<SelectMusics> {
  List<String> Musics = [
    "music/audio1.mp3",
    "music/audio2.mp3",
    "music/audio3.mp3",
    "music/audio4.mp3",
    "music/audio5.mp3",
    "music/audio6.mp3",
    "music/audio7.mp3",
    "music/audio8.mp3",
    "music/audio9.mp3",
  ];

  List<String> MusicsName = [
    "Arabic Remix Song",
    "arbic song zamil zamil(256k)",
    "Bannu Dj dance",
    "Beqadra Nehaal Naseem",
    "Burak Balkan Feel",
    "Dil Sambhal Jaa Zara",
    "Kabhi jo badal barse",
    "Kaifi Khalil",
    "Lambiyaan Si Judaiyaa",
  ];

  List<String> MusicsImage = [
    "assets/images/image1.jpg",
    "assets/images/image2.jpg",
    "assets/images/image3.jpg",
    "assets/images/image4.jpg",
    "assets/images/image5.jpg",
    "assets/images/image6.jpg",
    "assets/images/image7.jpg",
    "assets/images/image8.jpg",
    "assets/images/image9.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Music"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 9,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                  child: Image.asset(MusicsImage[index],height: 50,width: 50,fit: BoxFit.cover,)),
              title: Text(MusicsName[index]),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AudioMusic(
                  musicsImage: MusicsImage[index],
                  musicsName: MusicsName[index],
                  musicsURL: Musics[index],
                )));
              },
            ),
          );
        },
      ),
    );
  }
}

