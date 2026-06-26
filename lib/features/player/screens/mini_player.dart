import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/features/player/screens/podcast_player_screen.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/podcast_provider.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PodcastProvider>();

    if (provider.currentTitle == null) return const SizedBox.shrink();

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => PodcastPlayerScreen(
            audioPaths: provider.currentPath!,
            title: provider.currentTitle!,
            description: "Currently Playing",
          ),
        ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: const Color(0xff111827),
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: Colors.white10),
          boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 10)],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset("assets/images/ai_podcast_logo.png", width: 40.w, height: 40.w, fit: BoxFit.cover),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(provider.currentTitle!, maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp)),
                  Text("Tap to open player", style: TextStyle(color: Colors.white54, fontSize: 10.sp)),
                ],
              ),
            ),
            IconButton(
              icon: Icon(provider.isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded, color: Colors.white, size: 30.sp),
              onPressed: () => provider.togglePlay(),
            ),
            IconButton(
              icon: Icon(Icons.close, color: Colors.white38, size: 20.sp),
              onPressed: () => provider.stopAndClear(), // Provider mein ye function bana lein
            ),
          ],
        ),
      ),
    );
  }
}