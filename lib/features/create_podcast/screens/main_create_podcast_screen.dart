import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/features/create_podcast/screens/voice_selection_screen.dart';

import '../../../core/services/navigator/navigator.dart';
import '../../../core/services/script_service.dart';
import '../../profile/widgets/profile_header.dart';
import '../../settings/screen/app_setting_screen.dart';
import '../widgets/coustom_textformfiled.dart';
import '../widgets/premium_form_button.dart';
import '../widgets/preview-card.dart';

import '../../../core/widgets/bottom_nav_bar.dart';import '../widgets/coustom_voice_card.dart';

class MainCreatePodcastScreen extends StatefulWidget{
  const MainCreatePodcastScreen({super.key});
  @override
  State createState()=> _CreatePodcastScreenState();}
class _CreatePodcastScreenState extends State<MainCreatePodcastScreen>{
  bool isLoading=true;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController outlineController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    outlineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xff050816),bottomNavigationBar:
  Padding(
    padding: EdgeInsets.only(
      left: 14.w,
      right: 14.w,
      bottom: 30.h,
    ),
    child: const BottomNavbar(selectedIndex: 2,),
  ),
    body: SafeArea(child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric( horizontal: 16.w,
            vertical: 10.h,),
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
                  color:  const Color(0xff4F7CFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp.clamp(16.0, 24.0),

                ),
              ),
              const Spacer(),
              ProfileHeader(icon:  Icons.notifications_none, onTap: () {  },),
              SizedBox(width: 8.w,),
              ProfileHeader(icon: Icons.settings_outlined, onTap: () { AppRoutes.push(context,const AppSettingScreen()); },),
              SizedBox(width: 8.w,),

            ],
          ),
        ),  Divider(color: Colors.white10, height: 1.h,),

        Expanded(child: SingleChildScrollView(child:Padding(
            padding:EdgeInsets.all(10.w),child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
       Text(
            "Create New Podcast",
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 22.sp.clamp(18.0, 28.0),
              fontWeight: FontWeight.bold,
              letterSpacing:1.5,
            ),
          ),


          SizedBox(height: 8.h),
          Text(
            "Transform your ideas into professional-grade audio\nwith AI-driven narration and sound engineering.",
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 12.sp.clamp(10.0, 14.0),
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        Container(
            margin: EdgeInsets.symmetric(vertical: 15.h),
            width: double.infinity,
            padding:EdgeInsets.symmetric(
              horizontal: 13.w,
              vertical: 20.h,
            ),
            decoration: BoxDecoration(
              color: const Color(0xff0B0F1A),
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(
                color: Colors.white10,
              ),

            ),child: Column(
            children: [
              CoustomTextformfiled(controller: titleController, hintText: "e.g. The Future of Quantum Computing", isOutlineField: false, label: "PODCAST TITLE", maxLines: 1)
              , SizedBox(height: 15.h,),
              CoustomTextformfiled(controller:outlineController , hintText:   "Enter a detailed description or paste your rough notes here...",
                  isOutlineField: true, label:   "MAIN TOPIC OR SCRIPT OUTLINE", maxLines: 6),
            ])),
            SizedBox(height: 20.h,),
            PremiumFormSection(
              titleController: titleController,
              outlineController: outlineController,
            ),
            SizedBox(height: 30.h,),
            PreviewCard(imagePath:"assets/images/trending1.png" , title: "DRAFT PREVIEW", subtitle: "VOX Sound Profile: Cinematic", onTap: (){}),
            SizedBox(height: 40.h,)
        ])
        )))])
  )
    );

  }

}