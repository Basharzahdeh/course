import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class Video {
  final String title;
  final String url;

  Video({required this.title, required this.url});
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  VideoPlayerScreen({required this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;
  String vUrl = '';
  bool check = false;

  @override
  void initState() {
    super.initState();
    const url = "https://www.youtube.com/watch?v=SMKPKGW083c";
    vUrl = url;
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(loop: true, autoPlay: true),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
        ),
        builder: (context, player) => Scaffold(
          appBar: AppBar(
            title: Text('Course Details'),
          ),
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  child: vUrl != null
                      ? player
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset("assets/Eltizam.png"))),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Column(

                  children: [
                    Row(
                      children: [
                        Text(
                          ('This Course Include:'),
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 3,
                  height: MediaQuery.of(context).size.width * .1,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.ondemand_video),
                            SizedBox(
                              width: 15,
                            ),
                            Text("Hours: 60")
                          ],
                        ),
                      ]),
                ),
              ),
                  Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 3,
                  height: MediaQuery.of(context).size.width * .1,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.schedule),
                            SizedBox(
                              width: 15,
                            ),
                            Text("From 10/5/2023")
                          ],
                        ),
                      ]),
                ),
              ),  Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 3,
                  height: MediaQuery.of(context).size.width * .1,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.schedule),
                            SizedBox(
                              width: 15,
                            ),
                            Text("To 10/6/2023")
                          ],
                        ),
                      ]),
                ),
              ),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    width: MediaQuery.of(context).size.width * .85,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromRGBO(253, 194, 5, 1)),
                    child: Center(
                        child: Text(
                          "Enroll for Free",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
            ]),
          ),
        ),
      );
}
