import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerVideoWidget extends StatelessWidget {
  final String videoId;
  final int startTimeSeconds;
  final int endTimeSeconds;

  const PlayerVideoWidget({super.key, required this.videoId, required this.startTimeSeconds, required this.endTimeSeconds});

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        loop: true,
        disableDragSeek: true,
        forceHD: true,
        startAt: startTimeSeconds,
        endAt: endTimeSeconds,
      ),
    );

    return Center(
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        progressColors: const ProgressBarColors(
          playedColor: Colors.blue,
          handleColor: Colors.blueAccent,
        ),
        bottomActions: [
          CurrentPosition(),
          ProgressBar(
            isExpanded: true,
            colors: const ProgressBarColors(
              playedColor: Colors.blue,
              handleColor: Colors.blueAccent,
            ),
          ),
          RemainingDuration(),
        ],
      ),
    );
  }
}
