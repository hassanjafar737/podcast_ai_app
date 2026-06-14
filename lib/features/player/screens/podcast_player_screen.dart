import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:podcast_ai_app/core/widgets/bottom_nav_bar.dart';
import 'package:podcast_ai_app/features/profile/widgets/profile_header.dart';
import '../widgets/player_action_button.dart';

class PodcastPlayerScreen extends StatefulWidget {
  final String audioPath;
  const PodcastPlayerScreen({super.key, required this.audioPath});
  @override
  State<PodcastPlayerScreen> createState() => _PodcastPlayerScreenState();
}

class _PodcastPlayerScreenState extends State<PodcastPlayerScreen> {
  final AudioPlayer _player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    try {
      print("DEBUG: Player trying to load: \${widget.audioPath}");
      final file = File(widget.audioPath);
      if (await file.exists()) {
        print("DEBUG: File exists, size: \${await file.length()} bytes");
        await _player.setFilePath(widget.audioPath);
        
        _player.durationStream.listen((d) {
          if (mounted) setState(() => duration = d ?? Duration.zero);
        });
        _player.positionStream.listen((p) {
          if (mounted) setState(() => position = p);
        });
        _player.playerStateStream.listen((state) {
          if (mounted) setState(() => isPlaying = state.playing);
        });
        
        print("DEBUG: Player successfully loaded file");
        _player.play();
      } else {
        print("DEBUG: File NOT found at path: \${widget.audioPath}");
      }
    } catch (e) {
      print("DEBUG: Error loading audio into player: \$e");
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  String _formatDuration(Duration d) {
    String minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "\$minutes:\$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff050816),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 14.h),
        child: const BottomNavbar(selectedIndex: 2),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.keyboard_arrow_down, color: Colors.white70, size: 24.sp.clamp(20.0, 30.0)),
                  ),
                  SizedBox(width: 8.w),
                  Text("VOX AI", style: TextStyle(color: const Color(0xffC4B5FD), fontWeight: FontWeight.bold, fontSize: 18.sp.clamp(16.0, 24.0))),
                  const Spacer(),
                  ProfileHeader(icon: Icons.cast_connected, onTap: () {}),
                  SizedBox(width: 8.w),
                  ProfileHeader(icon: Icons.notifications_none, onTap: () {}),
                  SizedBox(width: 8.w),
                  Container(
                    width: 32.w.clamp(28.0, 40.0),
                    height: 32.w.clamp(28.0, 40.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white12),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/myimg.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.white10, height: 1.h),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Container(
                      width: double.infinity,
                      height: 250.h.clamp(280.0, 450.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28.r),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/profile1.png"),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.withOpacity(0.15),
                            blurRadius: 30,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "The Neural Future of Sound",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28.sp.clamp(22.0, 36.0),
                          height: 1.15,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Episode 42 . AI & Creativity", style: TextStyle(color: Colors.white54, fontWeight: FontWeight.w600, fontSize: 12.sp.clamp(10.0, 14.0))),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Slider(
                      min: 0,
                      max: duration.inSeconds.toDouble(),
                      value: position.inSeconds.toDouble().clamp(0, duration.inSeconds.toDouble() > 0 ? duration.inSeconds.toDouble() : 0),
                      onChanged: (value) {
                        _player.seek(Duration(seconds: value.toInt()));
                      },
                      activeColor: const Color(0xffC084FC),
                      inactiveColor: Colors.white10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_formatDuration(position), style: TextStyle(color: Colors.white38, fontSize: 10.sp.clamp(8.0, 12.0), fontWeight: FontWeight.w600)),
                        Text(_formatDuration(duration), style: TextStyle(color: Colors.white38, fontSize: 10.sp.clamp(8.0, 12.0), fontWeight: FontWeight.w600)),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: const Color(0xff111827),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text("1.5x", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.sp.clamp(10.0, 14.0))),
                        ),
                        IconButton(
                          icon: Icon(Icons.replay_10, color: Colors.white70, size: 28.sp.clamp(24.0, 32.0)),
                          onPressed: () => _player.seek(Duration(seconds: (position.inSeconds - 10).clamp(0, duration.inSeconds))),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (isPlaying) {
                              _player.pause();
                            } else {
                              _player.play();
                            }
                          },
                          child: Container(
                            width: 80.w.clamp(60.0, 100.0),
                            height: 80.w.clamp(60.0, 100.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(
                                colors: [Color(0xff2563EB), Color(0xff8B5CF6)],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.purple.withOpacity(0.35),
                                  blurRadius: 25,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Icon(isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded, color: Colors.white, size: 42.sp.clamp(32.0, 52.0)),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.forward_10, color: Colors.white70, size: 28.sp.clamp(24.0, 32.0)),
                          onPressed: () => _player.seek(Duration(seconds: (position.inSeconds + 10).clamp(0, duration.inSeconds))),
                        ),
                        Icon(Icons.playlist_add, color: Colors.white70, size: 24.sp.clamp(20.0, 28.0)),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PlayerActionButton(icon: Icons.share_outlined, title: "SHARE", onTap: () {}),
                        PlayerActionButton(icon: Icons.file_download_outlined, title: "OFFLINE", onTap: () {}),
                        PlayerActionButton(icon: Icons.favorite_border, title: "LIKE", onTap: () {}),
                        PlayerActionButton(icon: Icons.timer_sharp, title: "SLEEP", onTap: () {}),
                      ],
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
