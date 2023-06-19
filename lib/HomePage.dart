import 'package:course/Details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Video {
  final String title;
  final String url;

  Video({required this.title, required this.url});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Video> videos = [
    Video(title: 'Video 1', url: 'https://example.com/video1.mp4'),
    Video(title: 'Video 2', url: 'https://example.com/video2.mp4'),
    Video(title: 'Video 3', url: 'https://example.com/video3.mp4'),
  ];

  void navigateToVideoPlayer(BuildContext context, String videoUrl) {
    // Navigate to the video player screen and pass the video URL
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPlayerScreen(videoUrl: videoUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home screen"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                ('Courses '),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .54,
              width: MediaQuery.of(context).size.width * .9,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * .65,
                          height: MediaQuery.of(context).size.height * .3,
                          child: Card(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Column(
                                children: [
                                  Image.network(
                                    "https://images.indianexpress.com/2020/04/online759.jpg",
                                    width:
                                        MediaQuery.of(context).size.width * .66,
                                    height:
                                        MediaQuery.of(context).size.width * .22,
                                    fit: BoxFit.fill,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .15,
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Course",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Text(
                                                "50",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                ('Hours'),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Expanded(
                                          child: Row(
                                            verticalDirection:
                                                VerticalDirection.down,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                ('From:'),
                                              ),
                                              Text(
                                                "10/5/2023",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            verticalDirection:
                                                VerticalDirection.down,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                ('To:'),
                                              ),
                                              Text(
                                                "10/6/2023",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ExpansionTile(
                                    title: Text(
                                      ('Videos'),
                                    ),
                                    initiallyExpanded: false,
                                    // Whether the tile is initially expanded or collapsed
                                    maintainState: true,
                                    // Whether to maintain the state of the tile (e.g., text input)

                                    children: <Widget>[
                                      // The content that is shown when the tile is expanded

                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .2,
                                        child: ListView.builder(
                                          itemCount: videos.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              leading: Icon(Icons.play_arrow),
                                              title: Text(videos[index].title),
                                              onTap: () {
                                                navigateToVideoPlayer(
                                                    context, videos[index].url);
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                    onExpansionChanged: (bool expanded) {
                                      // Handle the expansion state change of the tile
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoPlayerScreen(
                                  videoUrl: videos[index].url,
                                ),
                              ));
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
