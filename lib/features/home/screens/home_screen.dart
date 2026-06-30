import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/core/widgets/bottom_nav_bar.dart';
import 'package:podcast_ai_app/features/create_podcast/screens/ai_generating_loading.dart';
import 'package:podcast_ai_app/features/discover/widgets/header_icon.dart';
import 'package:podcast_ai_app/features/home/widgets/create_podcast_screen.dart';
import 'package:podcast_ai_app/features/home/widgets/feature_card.dart';
import 'package:podcast_ai_app/features/player/screens/podcast_player_screen.dart';
import 'package:podcast_ai_app/features/poscast_editor/screens/export_success_screen.dart';
import '../../../core/services/navigator/navigator.dart';
import '../../library/widgets/library_header.dart';
import '../../player/screens/mini_player.dart';
import '../../settings/screen/app_setting_screen.dart';
import '../widgets/dashboard_screen.dart';
import '../widgets/recent_project_card.dart';
import '../widgets/trending_podcast_tile.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
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
          child:  BottomNavbar(selectedIndex: 0,),),
      body: SafeArea(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              DashboardHeaderse( onProfileTap: () {  }, onNotificationTap: () { AppRoutes.push(context, ExportSuccessScreen(title: "", audioPath: "audioPath"));  }, onSettingsTap: () { AppRoutes.push(context, AppSettingScreen()); },),

            Divider(color: Colors.white10, height: 1.h,),
            Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       SizedBox(height: 20.h,),
                        Text(
                          "DASHBOARD",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2,
                          ),
                        ),
                      SizedBox(height: 4.h),
                        Text(
                          "Hi, Hassaan👋",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -.3,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        CreatePodcastScreen(),
                        SizedBox(height: 25.h,),
                       Row(
                          children: [
                               QuickActionCard(
                                title: "AI Scripts",
                                subtitle: "Generate powerful\n podcast scripts",
                                icon: Icons.auto_awesome_outlined,
                                iconColor: const Color(0xffA855F7),
                                onTap: () {},
                              ),

                            SizedBox(width: 10.w),
                             QuickActionCard(
                                title: "Voice Cloning",
                                subtitle: "Clone your voice with AI",
                                icon: Icons.graphic_eq,
                                iconColor: const Color(0xff3B82F6),
                                onTap: () {},
                              ),

                          ],
                        ),
            SizedBox(height: 30.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "RECENT PROJECTS",
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                    fontSize: 13.sp,
                  ),
                ),
                Text("VIEW ALL",style: TextStyle(color: Colors.purpleAccent.withOpacity(.8),fontWeight: FontWeight.bold, fontSize: 12.sp.clamp(10.0, 14.0))),
              ],
            ),
            SizedBox(height: 15.h,),
            SizedBox(
              height: 260.h.clamp(240.0, 300.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  RecentProjectCard(
                    title: "Future of AI Podcast",
                    imagePath: "assets/images/recentimg.png",
                    onTap: () {}, subtitle: "12 min ago",
                  ),
                  RecentProjectCard(
                    title:
                    "Cybernetic Soul",
                    imagePath: "assets/images/recentimg2.png",
                    onTap: () {}, subtitle: "Edited yesterday",
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Trending Podcasts",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 16.sp.clamp(14.0, 18.0)),),
              ],
            ),
            SizedBox(height: 15.h,),
            Column(
              children: [
                TrendingPodcastTile(
                  title: "Mind & Machine",
                  subtitle: "Science & Tech",
                  imagePath: "assets/images/trending1.png",
                  onTap: () {},
                ),
                TrendingPodcastTile(
                  title: "Digital Underground",
                  subtitle: "Society",
                  imagePath: "assets/images/trending2.png",
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: 20.h,),
          ],
        ),

      ),
      ),

            ),
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: MiniPlayer(),
            ),
          ]
        )
      )
    );
  }
}
