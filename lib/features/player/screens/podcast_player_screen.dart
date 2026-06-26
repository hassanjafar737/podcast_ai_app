import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:podcast_ai_app/core/providers/podcast_provider.dart';
import 'package:podcast_ai_app/core/widgets/bottom_nav_bar.dart';
import 'package:podcast_ai_app/features/profile/widgets/profile_header.dart';
import 'package:provider/provider.dart';
import '../widgets/player_action_button.dart';

class PodcastPlayerScreen extends StatefulWidget {
  final List<String> audioPaths;
  final String title;
  final String description;
  const PodcastPlayerScreen({super.key, required this.title,
    required this.description,required this.audioPaths});
  @override
  State<PodcastPlayerScreen> createState() => _PodcastPlayerScreenState();
}

class _PodcastPlayerScreenState extends State<PodcastPlayerScreen> {

 List<Duration> _trackDurations = []; // Durations of each individual track
  bool _isInitialised = false;
 Duration _totalDuration = Duration.zero;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
     final provider=Provider.of<PodcastProvider>(context,listen:false);
    provider.playNewPodcast(widget.title, widget.audioPaths);
    });
    _calculateTotalDuration();
  }
 Future<void> _calculateTotalDuration() async {
   Duration total = Duration.zero;
   List<Duration> computed = [];
   for (var path in widget.audioPaths) {
     final tempPlayer = AudioPlayer();
     final d = await tempPlayer.setAudioSource(AudioSource.file(path));
     if (d != null) {
       computed.add(d);
       total += d;
     }
     await tempPlayer.dispose();
   }
   setState(() {
     _trackDurations = computed;
     _totalDuration = total;
     _isInitialised = true;
   });
 }
 Duration _getAbsolutePosition(PodcastProvider provider) {//iska km slider ko ju hm pkr kr agay pichy krta wu
   int currentIndex = provider.player.currentIndex ?? 0;
   Duration acc = Duration.zero;
   for (int i = 0; i < currentIndex && i < _trackDurations.length; i++) {
     acc += _trackDurations[i];
   }
   return acc + provider.position;
 }

 void _seekAbsolute(Duration absPos, PodcastProvider provider) {//jb user audio ko jgha sa hilta tu ya audio ko sai jgha la jta haiG
   Duration acc = Duration.zero;
   for (int i = 0; i < _trackDurations.length; i++) {
     Duration trackD = _trackDurations[i];
     if (absPos >= acc && absPos <= acc + trackD) {
       provider.player.seek(absPos - acc, index: i);
       break;
     }
     acc += trackD;
   }
 }


  @override
  void dispose() {
    super.dispose();
  }

  String _formatDuration(Duration d) {
    String minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final provider=context.watch<PodcastProvider>();
    final currentAbsPos = _getAbsolutePosition(provider);
    final duration = provider.duration;
    final isPlaying = provider.isPlaying;

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
                        widget.title,
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
                        Text(widget.description, style: TextStyle(color: Colors.white54, fontWeight: FontWeight.w600, fontSize: 12.sp.clamp(10.0, 14.0))),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    if (!_isInitialised)
                      const Center(child: CircularProgressIndicator(color: Color(0xffC084FC)))
                    else
                    Column(
                      children: [
                        Slider(
                          min: 0,
                          max: _totalDuration.inSeconds.toDouble() > 0 ? _totalDuration.inSeconds.toDouble() : 1.0,
                          value: currentAbsPos.inSeconds.toDouble().clamp(0, _totalDuration.inSeconds.toDouble()),
                          onChanged: (value) {
                            _seekAbsolute(Duration(seconds: value.toInt()),provider);
                          },
                          activeColor: const Color(0xffC084FC),
                          inactiveColor: Colors.white10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(_formatDuration(currentAbsPos), style: TextStyle(color: Colors.white38, fontSize: 10.sp.clamp(8.0, 12.0), fontWeight: FontWeight.w600)),
                              Text("-${_formatDuration(duration - currentAbsPos)}", style: TextStyle(color: Colors.white38, fontSize: 10.sp.clamp(8.0, 12.0), fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
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
                          onPressed: () => provider.player.seek(provider.position-Duration(seconds: 10)),
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.togglePlay();
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
                            child: Icon(provider.isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded, color: Colors.white, size: 42.sp.clamp(32.0, 52.0)),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.forward_10, color: Colors.white70, size: 28.sp.clamp(24.0, 32.0)),
                          onPressed: () => provider.player.seek(provider.position +Duration(seconds: 10)),
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
