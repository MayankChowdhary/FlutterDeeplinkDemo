import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoPost extends StatefulWidget {
  final String videoUrl;

  const VideoPost({required this.videoUrl});

  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoPost> {
  late VideoPlayerController _controller;
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
      });

    /*_controller.addListener(() {

    });*/
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _shareVideo() {
    Share.share("https://deeplink-helper.netlify.app/?tab=videopost");
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          _controller.value.isInitialized
              ? Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                      Opacity(
                        opacity: 0.5,
                        child: IconButton(
                          iconSize: 64,
                          icon: Icon(
                            _isPlaying
                                ? Icons.pause_circle_outline
                                : Icons.play_circle_outline,
                            color: Colors.white,
                          ),
                          onPressed: _togglePlayPause,
                        ),
                      ),
                    ],
                  ),
                )
              : const Expanded(
                  child: SizedBox(
                    height: 200,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
          ListTile(
            title: const Text('Vintage Phonograph'),
            subtitle: const Text(
                'Did you know A phonograph, later called a Gramophone'),
            trailing: IconButton(
              iconSize: 40,
              icon: const Icon(Icons.share),
              color: Colors.blue,
              onPressed: _shareVideo,
            ),
          ),
        ],
      ),
    );
  }
}
