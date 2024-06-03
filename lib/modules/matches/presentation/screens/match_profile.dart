import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/core/widgets/main_text.dart';
import 'package:video_player/video_player.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/theme/color_app.dart';

// class PlayingMatchVideoScreen extends StatefulWidget {
//   final String matchUrl;
//   const PlayingMatchVideoScreen({Key? key, required this.matchUrl})
//       : super(key: key);
//
//   @override
//   State<PlayingMatchVideoScreen> createState() =>
//       _PlayingMatchVideoScreenState();
// }
//
// class _PlayingMatchVideoScreenState extends State<PlayingMatchVideoScreen> {
//   late FlickManager flickManager;
//   @override
//   void initState() {
//     super.initState();
//     flickManager = FlickManager(
//         videoPlayerController: VideoPlayerController.networkUrl(
//       Uri.parse("https://mazwai.com/video/9th-may-&amp;-fireworks/455089"),
//     ));
//   }
//
//   @override
//   void dispose() {
//     flickManager.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//
//         body:Container(
//         child: FlickVideoPlayer(flickManager: flickManager),
//     )
//
//
//
//
//     );
//
//   }
// }

class PlayYoutubeVideoMatch extends StatefulWidget {
  final String youtubeUrl;
  const PlayYoutubeVideoMatch({Key? key, required this.youtubeUrl})
      : super(key: key);

  @override
  State<PlayYoutubeVideoMatch> createState() => _PlayYoutubeVideoMatchState();
}

class _PlayYoutubeVideoMatchState extends State<PlayYoutubeVideoMatch> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    final videoId = YoutubePlayer.convertUrlToId(widget.youtubeUrl);
    _controller = YoutubePlayerController(
        initialVideoId: videoId!, flags: YoutubePlayerFlags(autoPlay: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        aspectRatio: 16 / 9,
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () => debugPrint("on ready"),
      ),
      builder: (context, player) {
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.clear, color: ColorApp.red),
                onPressed: () {
                  if (MediaQuery.of(context).orientation ==
                      Orientation.landscape) {
                    SystemChrome.setPreferredOrientations(
                        [DeviceOrientation.portraitUp]);
                  }
// else {
//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
// }
                  Navigator.pop(context);
                },
              ),
              title: MainText(
                text: "play Match",
                family: TextFontApp.boldFont,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // YoutubePlayer(
                  //   controller: _controller,
                  //   showVideoProgressIndicator: true,
                  //   onReady: () => debugPrint("on ready"),
                  // )
                ],
              ),
            ));
      },
    );
  }
}

class VideoMatchPageMp4 extends StatefulWidget {
  final String videoUrl;

  const VideoMatchPageMp4({super.key, required this.videoUrl});
  @override
  _VideoMatchPageMp4State createState() => _VideoMatchPageMp4State();
}

class _VideoMatchPageMp4State extends State<VideoMatchPageMp4> {
  late VideoPlayerController controller;
  ChewieController? _chewieController;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() async {
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));

    await controller.initialize();
    _chewieController = ChewieController(
        videoPlayerController: controller,
        autoPlay: true,
        looping: false,
        autoInitialize: true);

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    _chewieController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.clear, color: ColorApp.red),
          onPressed: () {
            if (MediaQuery.of(context).orientation == Orientation.landscape) {
              SystemChrome.setPreferredOrientations(
                  [DeviceOrientation.portraitUp]);
            }

            Navigator.pop(context);
          },
        ),
        title: MainText(
          text: "play Match",
          family: TextFontApp.boldFont,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(

          width: MediaQuery.of(context).size.width,
          height: 400.h,
          child: _chewieController != null
              // _chewieController.videoPlayerController.initialize()
              ? Chewie(
                  controller: _chewieController!,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 20),
                    Text('Loading'),
                  ],
                ),
        ),
      ),
    );
  }
}

class VideoMatchPage extends StatefulWidget {
  final String youtubeUrl;

  const VideoMatchPage({super.key, required this.youtubeUrl});

  @override
  _VideoMatchPageState createState() => _VideoMatchPageState();
}

class _VideoMatchPageState extends State<VideoMatchPage> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = [
    'nPt8bK2gbaU',
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ];

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.youtubeUrl);

    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              log('Settings Tapped!');
            },
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        // onEnded: (data) {
        //   _controller
        //       .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
        //   _showSnackBar('Next Video Started!');
        // },
      ),
      builder: (context, player) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.clear, color: ColorApp.red),
            onPressed: () {
              if (MediaQuery.of(context).orientation == Orientation.landscape) {
                SystemChrome.setPreferredOrientations(
                    [DeviceOrientation.portraitUp]);
              }

              Navigator.pop(context);
            },
          ),
          title: MainText(
            text: "play Match",
            family: TextFontApp.boldFont,
          ),
        ),
        body: ListView(
          children: [
            player,
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //       _space,
            //       _text('Title', _videoMetaData.title),
            //       _space,
            //       _text('Channel', _videoMetaData.author),
            //       _space,
            //       _text('Video Id', _videoMetaData.videoId),
            //       _space,
            //       Row(
            //         children: [
            //           _text(
            //             'Playback Quality',
            //             _controller.value.playbackQuality ?? '',
            //           ),
            //           const Spacer(),
            //           _text(
            //             'Playback Rate',
            //             '${_controller.value.playbackRate}x  ',
            //           ),
            //         ],
            //       ),
            //       _space,
            //
            //
            //
            //
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //
            //           IconButton(
            //             icon: Icon(
            //               _controller.value.isPlaying
            //                   ? Icons.pause
            //                   : Icons.play_arrow,
            //             ),
            //             onPressed: _isPlayerReady
            //                 ? () {
            //               _controller.value.isPlaying
            //                   ? _controller.pause()
            //                   : _controller.play();
            //               setState(() {});
            //             }
            //                 : null,
            //           ),
            //           IconButton(
            //             icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
            //             onPressed: _isPlayerReady
            //                 ? () {
            //               _muted
            //                   ? _controller.unMute()
            //                   : _controller.mute();
            //               setState(() {
            //                 _muted = !_muted;
            //               });
            //             }
            //                 : null,
            //           ),
            //           FullScreenButton(
            //             controller: _controller,
            //             color: Colors.blueAccent,
            //           ),
            //
            //         ],
            //       ),
            //       _space,
            //       // Row(
            //       //   children: <Widget>[
            //       //     // const Text(
            //       //     //   "Volume",
            //       //     //   style: TextStyle(fontWeight: FontWeight.w300),
            //       //     // ),
            //       //     // Expanded(
            //       //     //   child: Slider(
            //       //     //     inactiveColor: Colors.transparent,
            //       //     //     value: _volume,
            //       //     //     min: 0.0,
            //       //     //     max: 100.0,
            //       //     //     divisions: 10,
            //       //     //     label: '${(_volume).round()}',
            //       //     //     onChanged: _isPlayerReady
            //       //     //         ? (value) {
            //       //     //       setState(() {
            //       //     //         _volume = value;
            //       //     //       });
            //       //     //       _controller.setVolume(_volume.round());
            //       //     //     }
            //       //     //         : null,
            //       //     //   ),
            //       //     // ),
            //       //   ],
            //       // ),
            //      // _space,
            //       // AnimatedContainer(
            //       //   duration: const Duration(milliseconds: 800),
            //       //   decoration: BoxDecoration(
            //       //     borderRadius: BorderRadius.circular(20.0),
            //       //     color: _getStateColor(_playerState),
            //       //   ),
            //       //   padding: const EdgeInsets.all(8.0),
            //       //   child: Text(
            //       //     _playerState.toString(),
            //       //     style: const TextStyle(
            //       //       fontWeight: FontWeight.w300,
            //       //       color: Colors.white,
            //       //     ),
            //       //     textAlign: TextAlign.center,
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: const TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _space => const SizedBox(height: 10);
}
