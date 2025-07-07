import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class MovieTrailerPage extends StatefulWidget {
  const MovieTrailerPage({super.key, required this.trailerYtId});
  final trailerYtId;

  @override
  State<MovieTrailerPage> createState() => _MovieTrailerPageState();
}

class _MovieTrailerPageState extends State<MovieTrailerPage> {
  late YoutubePlayerController _controller;


  @override
  void initState() {
    super.initState();


    final videoId =
        YoutubePlayer.convertUrlToId(widget.trailerYtId.toString());
    _controller = YoutubePlayerController(
      initialVideoId: videoId.toString(),
      flags: const YoutubePlayerFlags(
        enableCaption: true,
        autoPlay: true,
        mute: false,
        forceHD: true,
        //controlsVisibleAtStart: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (value) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: [SystemUiOverlay.bottom]);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      },
      child: Scaffold(
        body: Center(
          child: SizedBox(
            height: 300,
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: YoutubePlayer(
                thumbnail: Image.network(
                  'https://img.youtube.com/vi/${widget.trailerYtId}/hqdefault.jpg',
                  fit: BoxFit.cover,
                ),
                controlsTimeOut: const Duration(milliseconds: 1500),
                controller: _controller,
                aspectRatio: 16 / 9,
                showVideoProgressIndicator: true,
                bufferIndicator: const Center(
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                    ),
                  ),
                ),
                progressIndicatorColor: Colors.amber,
                bottomActions: [
                  CurrentPosition(),
                  ProgressBar(
                    isExpanded: true,
                    colors: const ProgressBarColors(
                      playedColor: Colors.white,
                      handleColor: Colors.amber,
                    ),
                  ),
                  RemainingDuration(),
                  FullScreenButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
