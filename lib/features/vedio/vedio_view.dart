import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SimpleVideoPage extends StatefulWidget {
  final String url;
  const SimpleVideoPage({super.key, required this.url});

  @override
  State<SimpleVideoPage> createState() => _SimpleVideoPageState();
}

class _SimpleVideoPageState extends State<SimpleVideoPage> {
  late final VideoPlayerController _c;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    _c = VideoPlayerController.networkUrl(
      Uri.parse(widget.url),
      // لو بدك هيدر (توكن مثلاً):
      // httpHeaders: {'Authorization': 'Bearer ...'},
    );
    try {
      await _c.initialize();
      await _c.play();
      if (mounted) setState(() => _ready = true);
    } catch (e) {
      debugPrint('Video init error: $e');
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child:
            !_ready
                ? const CircularProgressIndicator()
                : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    AspectRatio(
                      aspectRatio: _c.value.aspectRatio,
                      child: VideoPlayer(_c),
                    ),
                    // شريط التقدّم + سحب
                    VideoProgressIndicator(_c, allowScrubbing: true),
                    // زر Play/Pause كبير بالوسط
                    Positioned.fill(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            _c.value.isPlaying ? _c.pause() : _c.play();
                          });
                        },
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 150),
                          opacity: _c.value.isPlaying ? 0.0 : 1.0,
                          child: const Icon(
                            Icons.play_circle,
                            size: 72,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
