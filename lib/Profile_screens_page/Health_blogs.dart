import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Health_blog extends StatefulWidget {
  const Health_blog({Key? key}) : super(key: key);

  @override
  State<Health_blog> createState() => _Health_blogState();
}

class _Health_blogState extends State<Health_blog> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Scaffold(
            backgroundColor: Colors.blueGrey[50],
            appBar:
            AppBar(
                toolbarHeight: 50, centerTitle: true, elevation: 1,
                title: Text("Health Blogs", style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white) ,),
                backgroundColor: Colors.pink[300]),
            body: YoutubeScreen(videoId: 'GQyWIur03aw')
        ),
      ],
    );
  }
}
// class MyApp extends StatelessWidget {
//   static const customSwatch = MaterialColor(
//     0xFFFF5252,
//     <int, Color>{
//       50: Color(0xFFFFEBEE),
//       100: Color(0xFFFFCDD2),
//       200: Color(0xFFEF9A9A),
//       300: Color(0xFFE57373),
//       400: Color(0xFFEF5350),
//       500: Color(0xFFFF5252),
//       600: Color(0xFFE53935),
//       700: Color(0xFFD32F2F),
//       800: Color(0xFFC62828),
//       900: Color(0xFFB71C1C),
//     },
//   );
//
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: customSwatch,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const videoplayer(),
//     );
//   }
// }

class YoutubeScreen extends StatefulWidget {
  final String videoId;

  const YoutubeScreen({Key? key, required this.videoId}) : super(key: key);

  @override
  _YoutubeScreenState createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Video'),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onReady: () {
            // Do something when the player is ready.
          },
        ),
      ),
    );
  }
}
