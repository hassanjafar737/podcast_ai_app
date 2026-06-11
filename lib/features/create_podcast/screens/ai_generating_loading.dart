import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/core/services/navigator/navigator.dart';

import '../../../core/widgets/bottom_nav_bar.dart';
import '../../discover/widgets/header_icon.dart';
import '../../settings/screen/app_setting_screen.dart';
import '../widgets/status_card.dart';

class AiGeneratingLoading extends  StatefulWidget{
  const AiGeneratingLoading({super.key});
  @override
  State<AiGeneratingLoading> createState()=>_AiGeneratingLoadingState();
}
class _AiGeneratingLoadingState extends State<AiGeneratingLoading>{
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
        child: const BottomNavbar(selectedIndex: 2,),),
      body: SafeArea(child: Column(
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
                HeaderIcon(icon: Icons.settings_outlined,onTap: (){AppRoutes.push(context,const AppSettingScreen());},),
              ],
            ),
          ),Divider(color: Colors.white10, height: 1.h,),
          Expanded(
            child:SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20.h,),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 240.w.clamp(200.0, 300.0),
                          height: 240.w.clamp(200.0, 300.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white10,
                            ),
                          ),
                        ),
                        Container(
                          width: 220.w.clamp(180.0, 280.0),
                          height: 220.w.clamp(180.0, 280.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white10,
                            ),
                          ),
                        ),
                        Container(
                          width: 150.w.clamp(120.0, 200.0),
                          height: 150.w.clamp(120.0, 200.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.purple.withOpacity(0.35),
                                blurRadius: 40,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2.r),
                            child: Image.asset(
                              "assets/images/ai_podcast_logo.png",
                              fit: BoxFit.cover,
                            ),
                          ),

                        ),
                        Positioned(
                          right: 30.w,
                          bottom: 40.h,
                          child: Container(
                            width: 10.w,
                            height: 10.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffC084FC),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h,),
                    Text(
                      "AI is crafting your episode...",
                      textAlign:TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp.clamp(16.0, 24.0),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Text(
                      "SYNTHESIZING VOICES...",
                      style: TextStyle(
                        color: Colors.white54,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp.clamp(10.0, 14.0),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 6.h,
                          decoration:
                          BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        Container(
                          width: 150.w,
                          height: 6.h,
                          decoration:
                          BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xff2563EB),
                                Color(0xffC084FC),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.h,),
                    Wrap(
                      spacing: 14.w,
                      runSpacing: 16.h,
                      children: const [
                        StatusCard(
                          icon: Icons.check_circle,
                          title: "SCRIPTING",
                          completed: true,
                        ),
                        StatusCard(
                          icon: Icons.mic,
                          title: "VOICE CASTING",
                          completed: true,
                        ),
                        StatusCard(
                          icon: Icons.graphic_eq,
                          title: "SYNTHESIZING",
                          completed: false,
                        ),
                        StatusCard(
                          icon: Icons.auto_fix_high,
                          title: "MASTERING",
                          completed: false,
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      )
    );
  }

}