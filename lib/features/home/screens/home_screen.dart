import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/core/widgets/bottom_nav_bar.dart';
import 'package:podcast_ai_app/features/discover/widgets/header_icon.dart';
import 'package:podcast_ai_app/features/home/widgets/create_podcast_screen.dart';
import 'package:podcast_ai_app/features/home/widgets/feature_card.dart';
import '../../../core/services/navigator/navigator.dart';
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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.h,
              ),
              child: Row(
                children: [
                  Container(
                    width: 32.w.clamp(28.0, 40.0),
                    height: 32.w.clamp(28.0, 40.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white12,
                      ),
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/myimg.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),SizedBox(width: 8.w,),
                  Text(
                    "VOX AI",
                    style: TextStyle(
                      color: const Color(0xff4F7CFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp.clamp(16.0, 24.0),

                    ),
                  ),
                  const Spacer(),
                  HeaderIcon(
                    icon:  Icons.notifications_none, onTap: () {  },
                  ),

                  SizedBox(width: 8.w,),
                  HeaderIcon(icon: Icons.settings_outlined, onTap: () {AppRoutes.push(context,AppSettingScreen());  },),


                ],
              ),
            ),
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
                color: Colors.blueGrey,
                fontSize: 14.sp.clamp(12.0, 16.0),
                fontWeight:FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "Good Morning, Hassaan",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp.clamp(18.0, 26.0),
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),SizedBox(height: 10.h),
            CreatePodcastScreen(),
            SizedBox(height: 25.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: FeatureCard(onTap: () {  }, icon: Icons.auto_awesome, title: 'AI Scripts', iconColor: Colors.blue ,)),
                SizedBox(width: 15.w,),
                Expanded(child: FeatureCard(onTap: () {  }, icon: Icons.record_voice_over_outlined, title: 'Voice Cloning', iconColor: Colors.purple,)),
              ],
            ),
            SizedBox(height: 30.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent Projects",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 16.sp.clamp(14.0, 18.0)),),
                Text("VIEW ALL",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold, fontSize: 12.sp.clamp(10.0, 14.0))),
              ],
            ),
            SizedBox(height: 15.h,),
            SizedBox(
              height: 260.h.clamp(240.0, 300.0), // Height barha di
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
      )
            )]))
    );
  }
}
