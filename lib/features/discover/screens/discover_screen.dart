import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/core/widgets/bottom_nav_bar.dart';
import 'package:podcast_ai_app/features/discover/widgets/filter_chip.dart';
import 'package:podcast_ai_app/features/library/widgets/library_header.dart';
import '../../../core/services/navigator/navigator.dart';
import '../../player/screens/mini_player.dart';
import '../../settings/screen/app_setting_screen.dart';
import '../widgets/create_card.dart';
import '../widgets/podcast_card.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 14.w,
          right: 14.w,
          bottom: 30.h,
        ),
        child: const BottomNavbar(
          selectedIndex: 1,
        ),
      ),
      backgroundColor: const Color(0xff050816),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  child: DashboardHeaderse(
                    onProfileTap: () {},
                    onNotificationTap: () {},
                    onSettingsTap: () {
                      AppRoutes.push(context, const AppSettingScreen());
                    },
                  ),
                ),
                Divider(
                  color: Colors.white10,
                  height: 1.h,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24.h),

                          Container(
                            height: 56.h,
                            decoration: BoxDecoration(
                              color: const Color(0xff121629),
                              borderRadius: BorderRadius.circular(24.r),
                              border: Border.all(color: Colors.white.withOpacity(0.05)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.25),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                hintText: "Trending in Storytelling",
                                hintStyle: TextStyle(
                                  color: Colors.white38,
                                  fontSize: 14.sp,
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white38,
                                  size: 20.sp,
                                ),
                                suffixIcon: Icon(
                                  Icons.tune_outlined,
                                  color: const Color(0xffA855F7),
                                  size: 20.sp,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 16.h,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            "WEEKLY SPOTLIGHT",
                            style: TextStyle(
                              color: const Color(0xffA855F7),
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              fontSize: 12.sp,
                              shadows: [
                                Shadow(
                                  color: const Color(0xffA855F7).withOpacity(0.5),
                                  blurRadius: 10,
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "Discover Top AI Picks",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 30.sp,
                              letterSpacing: -0.4,
                              height: 1,
                            ),
                          ),
                          SizedBox(height: 24.h),

                          Container(
                            width: double.infinity,
                            height: 200.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.25),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24.r),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.asset(
                                      "assets/images/homescreen.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Colors.black.withOpacity(.60),
                                            Colors.black.withOpacity(.10),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(24.w),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 0.6.sw,
                                          child: Text(
                                            "Exploring the ethical boundaries of generative AI in modern media production.",
                                            style: TextStyle(
                                              color: const Color(0xffD1D5DB),
                                              fontSize: 14.sp,
                                              height: 1.55,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 16.h),
                                        InkWell(
                                          onTap: () {},
                                          borderRadius: BorderRadius.circular(16.r),
                                          child: Container(
                                            height: 48.h,
                                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                                            decoration: BoxDecoration(
                                              color: const Color(0xffA855F7),
                                              borderRadius: BorderRadius.circular(16.r),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color(0xffA855F7).withOpacity(0.4),
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 4),
                                                ),
                                              ],
                                            ),
                                            child: IntrinsicWidth(
                                              child: Center(
                                                child: Text(
                                                  "Listen Now",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Trending Podcasts",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.sp,
                                ),
                              ),
                              Text(
                                "VIEW ALL",
                                style: TextStyle(
                                  color: const Color(0xff8B5CF6),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),

                          SizedBox(
                            height: 40.h,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              children: [
                                FilterChipWidget(text: "All Tracks", active: true),
                                FilterChipWidget(text: "Ai News", active: false),
                                FilterChipWidget(text: "Story Telling", active: false),
                                FilterChipWidget(text: "Business", active: false),
                                FilterChipWidget(text: "Education", active: false)
                              ],
                            ),
                          ),
                          SizedBox(height: 24.h),
                          GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisSpacing: 16.w,
                            mainAxisSpacing: 20.h,
                            childAspectRatio: 0.62,
                            children: const [
                              PodcastCard(
                                image: "assets/images/discover1.png",
                                title: "The Ai Protocol",
                                subtitle: 'by Elena Vance',
                                playButton: false,
                              ),
                              PodcastCard(
                                image: 'assets/images/dis.png',
                                title: "Synthesized Reality",
                                subtitle: "by Marcus Chan",
                                playButton: true,
                              ),
                              PodcastCard(
                                image: "assets/images/discover3.png",
                                title: "The AI Protocol",
                                subtitle: "by Sarah Jenkins",
                                playButton: false,
                              ),
                              PodcastCard(
                                image: "assets/images/discover4.png",
                                title: "Sound & Silicon",
                                subtitle: "by David K. Aris",
                                playButton: false,
                              ),
                            ],
                          ),
                          SizedBox(height: 32.h),

                          Text(
                            "Featured Creators",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          SizedBox(
                            height: 130.h,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              children: const [
                                CreatorCard(
                                  image: "assets/images/profile1.png",
                                  name: "Luna Aethel",
                                  role: "Audio Sculptor",
                                ),
                                CreatorCard(
                                  image: "assets/images/profile2.png",
                                  name: "Oliver Vance",
                                  role: "Tech Philosopher",
                                ),
                                CreatorCard(
                                  image: "assets/images/profile3.png",
                                  name: "Ava Sterling",
                                  role: "AI Narrator",
                                ),
                                CreatorCard(
                                  image: "assets/images/profile4.png",
                                  name: "Finn Wilder",
                                  role: "Data Scientist",
                                )
                              ],
                            ),
                          ),

                          SizedBox(height: 110.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: MiniPlayer(),
            ),
          ],
        ),
      ),
    );
  }
}
