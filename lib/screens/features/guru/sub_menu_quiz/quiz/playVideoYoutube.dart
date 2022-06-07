import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../constants.dart';
import 'detail_quiz_screens.dart';

class PlayVideoDetailQuiz extends StatefulWidget {
  static String routeName = "/play_video_detail_quiz";
  static var args;
  @override
  _PlayVideo createState() => _PlayVideo();
}

class _PlayVideo extends State<PlayVideoDetailQuiz> {
  @override
  Widget build(BuildContext context) {
    // InputVideo.dataMapelPerIndex =
    PlayVideoDetailQuiz.args = ModalRoute.of(context)!.settings.arguments as Map;
    String linkVideo;
    linkVideo = YoutubePlayer.convertUrlToId(PlayVideoDetailQuiz.args['link_youtube'])!;
    return WillPopScope(
        child: Scaffold(
          // Setting up AppBar
            appBar: AppBar(
              backgroundColor: mBackgroundColor,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.blueGrey,
                onPressed: () {
                  _onBackPressed();
                },
              ),
              // automaticallyImplyLeading: false,
              title: HeadersForMenu('Video'),
              elevation: 0,
            ),
            backgroundColor: mBackgroundColor,
            body: ListView(
              children: [
                YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: linkVideo, //Add videoID.
                    flags: YoutubePlayerFlags(
                      hideControls: false,
                      controlsVisibleAtStart: true,
                      autoPlay: false,
                      mute: false,
                    ),
                  ),
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: kPrimaryColor,
                ),
                SizedBox(
                  height: 15,
                ),
                // Padding(
                //   padding: EdgeInsets.only(left: 10, right: 10),
                //   child: Text(
                //     args['judul_video'],
                //     overflow: TextOverflow.ellipsis,
                //     maxLines: 4,
                //     style: mTitleStyle16,
                //   ),
                // ),
              ],
            )
        ),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, DetailQuiz.routeName, arguments: PlayVideoDetailQuiz.args);
    return Future.value(true);
  }
}
