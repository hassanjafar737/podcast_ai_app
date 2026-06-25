import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/core/widgets/bottom_nav_bar.dart';
import 'package:podcast_ai_app/features/discover/widgets/filter_chip.dart';
import '../../../core/services/navigator/navigator.dart';
import '../../player/screens/mini_player.dart';
import '../../settings/screen/app_setting_screen.dart';
import '../widgets/create_card.dart';
import '../widgets/header_icon.dart';
import '../widgets/podcast_card.dart';
class DiscoverScreen extends StatefulWidget{
  const DiscoverScreen({super.key});
  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}
class _DiscoverScreenState extends State<DiscoverScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:Padding(
        padding: EdgeInsets.only(
          left: 14.w,
          right: 14.w,
          bottom: 30.h,
        ),
        child: BottomNavbar(selectedIndex: 1,),),
      backgroundColor: const Color(0xff050816),
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
                  ),
                  SizedBox(width: 8.w,),
                  Text(
                    "VOX AI",
                    style: TextStyle(
                      color: const Color(0xff5B8CFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp.clamp(16.0, 24.0),
                    ),
                  ),
                  const Spacer(),
                  HeaderIcon(icon:Icons.notifications_none , onTap: () {  },),
                  SizedBox(width: 8.w),
                  HeaderIcon(icon: Icons.settings_outlined,onTap: (){AppRoutes.push(context,AppSettingScreen());},),
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
                      SizedBox(height: 15.h),
                      Container(
                        height: 50.h.clamp(45.0, 60.0),
                        decoration: BoxDecoration(
                           color:Colors.white,
                          borderRadius: BorderRadius.circular(18.r),
                          border: Border.all(color: Colors.white10,),
                        ),
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            hintText: "Trending in Storytelling",
                            hintStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.sp.clamp(12.0, 16.0),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black54,
                              size: 20.sp.clamp(18.0, 24.0),
                            ),
                            suffixIcon: Icon(
                              Icons.tune_outlined,
                              color: Colors.black54,
                              size: 20.sp.clamp(18.0, 24.0),
                            ),
                            border: InputBorder.none,
                            contentPadding:
                            EdgeInsets.symmetric(
                              vertical: 12.h,
                            ),
                          ),

                        ),

                      ),
                      SizedBox(height: 25.h),
                      Text(
                        "WEEKLY SPOTLIGHT",
                        style:TextStyle(
                          color:Colors.purple,
                          fontWeight:FontWeight.bold,
                          letterSpacing:1.2,
                          fontSize: 10.sp.clamp(8.0, 12.0),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Discover Top AI Picks",
                        style:TextStyle(
                          color:Colors.white,
                          fontWeight:FontWeight.bold,
                          fontSize: 32.sp.clamp(24.0, 36.0),
                          height:1,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        width:double.infinity,
                        height: 70.h.clamp(60.0, 100.0),
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(24.r),
                          gradient:const LinearGradient(
                            colors:[
                              Color(0xff111827),
                              Color(0xff1E1B4B),
                            ],
                          ),
                          border:Border.all(color:Colors.white10,
                          ),
                        ),
                        child:ClipRRect(
                          borderRadius:BorderRadius.circular(15.r),
                          child:Stack(
                            children:[
                              Positioned.fill(
                                child:Image.asset(
                                  "assets/images/discover5.png",
                                  fit:BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding:EdgeInsets.all(16.w),
                                child:Text(
                                  "Exploring the ethical boundaries of generative AI in\nmodern media production.",
                                  style:TextStyle(
                                    color:Colors.white70,
                                    fontSize: 12.sp.clamp(10.0, 14.0),
                                    height:1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Container(
                        width:double.infinity,
                        padding:EdgeInsets.all(20.w),
                        decoration:BoxDecoration(
                          color:const Color(0xff0B0F1A),
                          borderRadius:BorderRadius.circular(22.r),
                          border:Border.all(
                            color:Colors.white10,
                          ),
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Text(
                                  "Synthesized Minds",
                                  style:TextStyle(
                                    color:Colors.white,
                                    fontWeight:FontWeight.bold,
                                    fontSize: 18.sp.clamp(16.0, 22.0),
                                  ),
                                ),
                                SizedBox(height:4.h),
                                Text(
                                  "Trending in Storytelling",
                                  style:TextStyle(
                                    color:Colors.white54,
                                    fontSize: 12.sp.clamp(10.0, 14.0),
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.auto_graph,
                              color:Colors.white70,
                              size: 20.sp.clamp(18.0, 24.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Container(
                        width:double.infinity,
                        padding:EdgeInsets.all(20.w),
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(22.r),
                          gradient:const LinearGradient(
                            colors:[
                              Color(0xff1A1D3D),
                              Color(0xff1B1035),
                            ],
                          ),
                          border:Border.all(
                            color:Colors.white10,
                          ),
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Text(
                                  "Tech Pulse AI",
                                  style:TextStyle(
                                    color:Colors.white,
                                    fontWeight:FontWeight.bold,
                                    fontSize: 18.sp.clamp(16.0, 22.0),
                                  ),
                                ),
                                SizedBox(height:4.h),
                                Text(
                                  "Daily Business Briefing",
                                  style:TextStyle(
                                    color:Colors.white54,
                                    fontSize: 12.sp.clamp(10.0, 14.0),
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.bolt,
                              color:Colors.white70,
                              size: 20.sp.clamp(18.0, 24.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h),
                      SizedBox(
                        height: 40.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                             FilterChipWidget(text:"All Tracks" , active: false),
                             FilterChipWidget(text:"Ai News" , active: false),
                             FilterChipWidget(text:"Story Telling" , active: false),
                             FilterChipWidget(text:"Business" , active: false),
                             FilterChipWidget(text:"Education" , active: false)
           ] ),
                ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Trending Podcasts",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp.clamp(18.0, 26.0),
                            ),
                          ),
                          Text(
                            "VIEW ALL",
                            style: TextStyle(
                              color: const Color(0xff8B5CF6),
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp.clamp(10.0, 14.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 20.h,
                        childAspectRatio: 0.62,
                        children: [
                          PodcastCard(
                             image: "assets/images/discover1.png", title: "bThe Ai Protocol", subtitle: 'by Elena Vance', playButton: false,
                          ),
                          PodcastCard(
                             image: 'assets/images/dis.png', title: "Synthesized Reality", subtitle: "by Marcus Chan", playButton: true,
                          ),
                          PodcastCard(
                             image: "assets/images/discover3.png", title: "The AI Protocol", subtitle: "by Sarah Jenkins", playButton: false,
                          ),
                          PodcastCard(
                            image: "assets/images/discover4.png", title: "Sound & Silicon", subtitle:  "by David K. Aris", playButton: false,
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        "Featured Creators",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp.clamp(18.0, 24.0),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        height: 150.h.clamp(130.0, 180.0), // Height barha di taake text wrap ho sake
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            CreatorCard(
                               image: "assets/images/profile1.png", name:  "Luna Aethel", role: "Audio Sculptor",
                            ),
                            CreatorCard(
                               image: "assets/images/profile2.png", name:  "Oliver Vance", role: "Tech Philosopher",
                            ),
                            CreatorCard(
                             image: "assets/images/profile3.png", name: "Ava Sterling", role: "AI Narrator",
                            ),
                            CreatorCard(image:  "assets/images/profile4.png", name:  "Finn Wilder", role:  "Data Scientist")
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h),
              ])
                ))),
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
  }}