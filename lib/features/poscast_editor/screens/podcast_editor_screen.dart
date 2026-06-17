import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/features/poscast_editor/screens/export_success_screen.dart';

import '../../../core/services/navigator/navigator.dart';
import '../../../core/widgets/bottom_nav_bar.dart';
import '../../player/screens/podcast_player_screen.dart';
class PodcastEditor extends StatefulWidget{
  final String audioPath;
  const PodcastEditor({super.key, required this.audioPath});
  @override
  State<StatefulWidget> createState() => _PodcastEditorState();
}
class _PodcastEditorState extends State<PodcastEditor>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff050816),
      bottomNavigationBar:  Padding(
        padding: EdgeInsets.only(
          left: 14.w,
          right: 14.w,
          bottom: 30.h,
        ),
        child: const BottomNavbar(selectedIndex: 2,),),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 10.h,
              ),
              child: Row(
                children: [
                  Text(
                    "VOX AI",
                    style: TextStyle(
                      color: const Color(0xff5B8CFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp.clamp(16.0, 24.0),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Text(
                    "The Neural Future of Sound",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 9.sp.clamp(8.0, 12.0),
                    ),
                  ),
                  const Spacer(),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20.r),
                      splashColor: Colors.white24,
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.history,
                            color: Colors.white70,
                            size: 14.sp.clamp(12.0, 18.0),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "HISTORY",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 10.sp.clamp(10.0, 14.0)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20.r),
                      splashColor: Colors.white24,
                      onTap: () {
                        AppRoutes.push(context,const ExportSuccessScreen());                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff3B82F6),
                              Color(0xffC084FC),
                            ],
                          ),
                        ),
                        child: Text(
                          "EXPORT",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp.clamp(10.0, 14.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.h,),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 250.w.clamp(200.0, 350.0),
                  height: 250.w.clamp(200.0, 350.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.35),
                        blurRadius: 60,
                        spreadRadius: 8,
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.r),
                  child: Image.asset(
                    "assets/images/elena1.png",
                    width: 250.w.clamp(200.0, 350.0),
                    height: 250.w.clamp(200.0, 350.0),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -10.h,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(40.r),
                      splashColor: Colors.white24,
                      onTap: () {
                        AppRoutes.push(context, PodcastPlayerScreen(audioPaths: [widget.audioPath]));
                      },
                      child: Container(
                        width: 55.w.clamp(45.0, 65.0),
                        height: 55.w.clamp(45.0, 65.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.3),
                              blurRadius: 20,),
                          ],
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                          size: 32.sp.clamp(28.0, 40.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h,),
            Text(
              "EP. 42 • AI DISCUSSION",
              style: TextStyle(
                color: Colors.white38,
                letterSpacing: 2,
                fontSize: 10.sp.clamp(8.0, 12.0),
              ),
            ),
            SizedBox(height: 25.h,),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32.w,
              ),
              child: Text(
                "The Neural Future of Sound",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32.sp.clamp(24.0, 40.0),
                  height: 1.2,
                ),
              ),
            ),
            SizedBox(height: 15.h,),
            Text(
              "Ep. 42 • Marcus Chen & Dr. Sarah Laine",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14.sp.clamp(12.0, 16.0),
              ),
            ),
            SizedBox(height: 15.h,),
            Text(
              "• From AI Vox Network",
              style: TextStyle(
                color: const Color(0xffC084FC),
                fontStyle: FontStyle.italic,
                fontSize: 10.sp.clamp(8.0, 12.0),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h,),
              child: Text(
                "AI GENERATED • AI VOX EXCLUSIVE CONTENT",
                style: TextStyle(
                  color: Colors.white24,
                  letterSpacing: 1.5,
                  fontSize: 8.sp.clamp(6.0, 10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}