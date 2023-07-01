import 'package:audioplayers/audioplayers.dart';
import 'package:chat_box/presentation/screen/video_player_screen.dart';
import 'package:chat_box/utils/app_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SoundAudioScreen extends StatefulWidget {
  const SoundAudioScreen({Key? key}) : super(key: key);

  @override
  State<SoundAudioScreen> createState() => _SoundAudioScreenState();
}

class _SoundAudioScreenState extends State<SoundAudioScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool play = false;
  double sliderValue = 0.0;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        play = state == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newDuration) {
      setState(() {
        position = newDuration;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  String formatTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF253334),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: height * 0.1),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.05),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset("assets/images/otp_bk.png", scale: 1.2),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.22, top: 7),
                    child: Text(
                      formatTime(
                        timeInSecond: position.inSeconds,
                      ),
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Slider(
              value: position.inSeconds.toDouble(),
              min: 0,
              max: duration.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await audioPlayer.seek(position);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatTime(
                    timeInSecond: position.inSeconds,
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  formatTime(timeInSecond: duration.inSeconds),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shuffle, color: Colors.white, size: 35),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.skip_previous_rounded, color: Colors.white, size: width * 0.09),
                ),
                IconButton(
                  icon: play == false ? const Icon(Icons.play_arrow) : const Icon(Icons.pause),
                  onPressed: () {
                    play = !play;
                    setState(() {
                      if (play == true) {
                        audioPlayer.play(AssetSource("music/mogal.m4a"));
                      } else {
                        audioPlayer.pause();
                      }
                    });
                  },
                  iconSize: width * 0.08,
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.skip_next, color: Colors.white, size: width * 0.09),
                ),
                IconButton(
                  onPressed: () {
                    print(AppList.musics["musics"]);
                  },
                  icon: Icon(Icons.repeat, color: Colors.white, size: width * 0.09),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Get.to(VideoPlayerScreen());
              },
              child: const Text("video Play"),
            )
          ],
        ),
      ),
    );
  }
}
