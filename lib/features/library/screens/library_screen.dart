import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/core/widgets/bottom_nav_bar.dart';
import 'package:podcast_ai_app/features/library/widgets/library_card.dart';

import '../../../core/services/navigator/navigator.dart';
import '../../discover/widgets/header_icon.dart';
import '../../settings/screen/app_setting_screen.dart';
class LibraryScreen extends StatefulWidget{
  const LibraryScreen({super.key});
  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}
class _LibraryScreenState extends State<LibraryScreen>{
  int selectedIndex=0;
  final List<String> filters=[
    "Drafts", "Published", "Downloads", "Favorites",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff050816),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 14.w,
          right: 14.w,
          bottom: 30.h,
        ),
        child: BottomNavbar(selectedIndex: 3,),),
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
                  HeaderIcon(icon:  Icons.notifications_none, onTap: () {  },),
                  SizedBox(width: 8.w,),
                  HeaderIcon(icon: Icons.settings_outlined, onTap: () {AppRoutes.push(context,const AppSettingScreen(), );  },),
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
                        "Library",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32.sp.clamp(24.0, 40.0),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Manage your AI-generated audio creations.",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 12.sp.clamp(10.0, 14.0),
                        ),
                      ),
                      SizedBox(height: 25.h,),
                       SizedBox(
                        height: 40.h.clamp(35.0, 50.0),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: filters.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: 10.w,
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 18.w,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  color: selectedIndex == index ? const Color(0xffD8B4FE)
                                      :const Color(0xff161616),
                                  border: Border.all(
                                    color: Colors.white10,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    filters[index],
                                    style: TextStyle(
                                      color: selectedIndex == index
                                          ? Colors.black
                                          : Colors.white70,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp.clamp(10.0, 14.0),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 25.h,),
                      LibraryCard(
                        image: "assets/images/profile2.png",
                        status: "DRAFTING",
                        date: "Last saved 2h ago",
                        title: "The Future of Neural Networks",
                        duration: "12:45",
                        voice: "AI Nova (Male)",
                        favorite: false,
                      ),
                      SizedBox(height: 15.h,),
                      LibraryCard(
                        image: "assets/images/profile4.png",
                        status: "PUBLISHED",
                        date: "Oct 24, 2023",
                        title: "Synthesis: Understanding AI",
                        duration: "45:12",
                        voice: "AI Seraphina",
                        favorite: true,
                      ),
                      SizedBox(height: 15.h,),
                      LibraryCard(
                         image: "assets/images/profile3.png",
                        status: "DRAFTING",
                        date: "Yesterday",
                        title: "Audio Post-Processing Masterclass",
                        duration: "08:22",
                        voice: "AI Nova (Male)",
                        favorite: false,
                      ),
                      SizedBox(height: 15.h,),
                      LibraryCard(
                        image: "assets/images/sienna.png",
                        status: "DRAFTING",
                        date: "Oct 20, 2023",
                        title: "Untitled Episode 04",
                        duration: "--:--",
                        voice: "Not assigned",
                        favorite: false,
                      ),
                      SizedBox(height: 100.h,),
                    ],
                  ),
                ),
              ),
            ),
         ]
        ),
      ),
    );
  }}