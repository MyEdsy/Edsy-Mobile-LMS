import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_apps/components/headers_for_sub_menu.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_bahan_ajar_siswa/bahan_ajar/bahan_ajar_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../constants.dart';
import 'detail_tugas_screens.dart';

class PlayVideoDetailTugas extends StatefulWidget {
  static String routeName = "/play_video_detail_tugas";
  static var args;
  @override
  _PlayVideo createState() => _PlayVideo();
}

class _PlayVideo extends State<PlayVideoDetailTugas> {
  @override
  Widget build(BuildContext context) {
    // InputVideo.dataMapelPerIndex =
    PlayVideoDetailTugas.args = ModalRoute.of(context)!.settings.arguments as Map;
    String linkVideo;
    linkVideo = YoutubePlayer.convertUrlToId(PlayVideoDetailTugas.args['link_youtube'])!;
    return WillPopScope(
        child: OrientationBuilder(builder: (context, orientaion) {
          switch (orientaion) {
            case Orientation.portrait:
              return Scaffold(
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
                    title: HeadersForMenu('Video Pembelajaran'),
                    elevation: 0,
                  ),
                  backgroundColor: mBackgroundColor,
                  body: ListView(
                    children: [
                      // _buildBurnerWidgetContent(),
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
                  ));

              // TODO: Handle this case.
              break;
            case Orientation.landscape:
              return Scaffold(
                  resizeToAvoidBottomInset: true,
                  backgroundColor: Theme.of(context).appBarTheme.color,
                  body: YoutubePlayer(
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
                  ));

              // TODO: Handle this case.
              break;
          }
        }),
        onWillPop: _onBackPressed);
  }

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    Navigator.pushNamed(context, DetailTugas.routeName, arguments: PlayVideoDetailTugas.args);
    return Future.value(true);
  }
}
