import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/core/widgets/bottom_nav_bar.dart';
import 'package:podcast_ai_app/features/subsciptions/widgets/premium_plan_card.dart';

import '../../../core/services/navigator/navigator.dart';
import '../../settings/screen/app_setting_screen.dart';
import '../widgets/feature_row.dart';
import '../widgets/subscription_header.dart';

class SubscriptionScreen extends StatefulWidget{
  const SubscriptionScreen({super.key});
  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}
class _SubscriptionScreenState extends State<SubscriptionScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 14.w,
          right: 14.w,
          bottom: 30.h,
        ),
        child: const BottomNavbar(selectedIndex: 2,),),
      body: SafeArea(child: Column(children: [Padding(padding: EdgeInsets.symmetric( horizontal: 16.w,
        vertical: 10.h,),
        child: Row(
          children: [
            Text(
              "VOX AI",
              style: TextStyle(
                color:  const Color(0xff4F7CFF),
                fontWeight: FontWeight.bold,
                fontSize: 24.sp.clamp(20.0, 32.0),

              ),
            ),
            const Spacer(),
            SubscriptionHeader(icon:  Icons.notifications_none, onTap: () {  },),
            SizedBox(width: 8.w,),
            SubscriptionHeader(icon: Icons.settings_outlined, onTap: () {  },),
            SizedBox(width: 8.w,),
            Container(
              width: 32.w.clamp(28.0, 40.0),
              height: 32.w.clamp(28.0, 40.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white12,
                ),
                image: const DecorationImage(
                  image: AssetImage("assets/images/profile1.png",),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),  Divider(color: Colors.white10, height: 1.h,),
        Expanded(child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w,
                  vertical: 4.h,),
                margin: EdgeInsets.all(3.w),
                alignment: Alignment.center,
                width: 130.w.clamp(110.0, 160.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: const Color(0xff2A2145),
                  border: Border.all(
                    color: const Color(0xff8B5CF6),
                    width: 0.6.w,
                  ),
                ),
                child: Text(
                  "PREMIUM ACCESS",
                  style: TextStyle(
                    color: const Color(0xffD8B4FE),
                    overflow: TextOverflow.visible,
                    fontSize: 10.sp.clamp(8.0, 12.0),
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
              ),SizedBox(height: 4.h,),
              Text("Unlock Pro", style: TextStyle(
                color:  Colors.white,
                fontSize: 32.sp.clamp(24.0, 40.0),
                fontWeight: FontWeight.bold,
              ),),SizedBox(height: 4.h,),
              Text("Elevate your audio production with limitless\nAI voices, cinematic mastering, and\nprofessional export tools",
                textAlign: TextAlign.center,
                style: TextStyle(
                color:  Colors.white54,
                fontSize: 14.sp.clamp(12.0, 18.0),

              ),),
              SizedBox(height: 30.h,),
              PremiumPlanCard(
                title:"Free",
                price:"\$0",
                duration:"/forever",
                features:[
                  "5 AI voices per month",
                  "Standard MP3 exports",
                  "Public community library",
                  "Custom background music",
                ],
                recommended:false,
                buttonText:"CURRENT PLAN",
                onTap:(){},
              ),
              SizedBox(height: 20.h),
              PremiumPlanCard( title:"Pro",
                price:"\$19",
                duration:"/month",
                features:[
                  "Unlimited AI voices",
                  "Lossless WAV & FLAC exports",
                  "Custom music AI generator",
                  "Priority cloud rendering",
                  "Commercial usage rights",
                ],
                recommended:true,
                buttonText:"UPGRADE NOW",
                onTap:(){},
              ),
              SizedBox(height: 30.h),
                Text(
                  "Feature Breakdown",
                  textAlign: TextAlign.center,
                  style:TextStyle(
                    color:Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp.clamp(16.0, 24.0),
                  ),
                ),

              SizedBox(height: 20.h),
                 Row(
                children:[
                  Expanded(
                    flex:2,
                    child:Padding(padding: EdgeInsets.all(12.w),
                   child:  Text(
                      "CAPABILITIES",
                      style:TextStyle(
                        color:Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 9.sp.clamp(8.0, 11.0),
                      ),
                    ),
                    )
                  ),
                  Expanded(
                    child:Text(
                      "FREE PLAN",
                      textAlign: TextAlign.right,
                      style:TextStyle(
                        color:Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 9.sp.clamp(8.0, 11.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 40.w,),
                  Expanded(
                    child:Text(
                      "PRO PLAN",
                      textAlign: TextAlign.left,
                      style:TextStyle(
                        color: const Color(0xffC084FC),
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp.clamp(8.0, 12.0),

                      ),

                    ),

                  ),

                ],
              ),
              FeatureRow(
                title:"AI Voice Selection",
                freePlan:"Limited (5/mo)",
                proPlan:"Unlimited",
              ),
              FeatureRow(
                title:"Audio Export Quality",
                freePlan:"Standard (128kbps)",
                proPlan:"Ultra HD Lossless",
              ),
              FeatureRow(
                title:"Custom Music Integration",
                freePlan:"✕",
                proPlan:"✓",
              ),
              FeatureRow(
                title:"AI Audio Mastering",
                freePlan:"Basic",
                proPlan:"Advanced Cinematic",
              ),
              FeatureRow(
                title:"Cloud Storage",
                freePlan:"10GB",
                proPlan:"100GB",
              ),
              SizedBox(height: 30.h),
              Padding(padding: EdgeInsets.all(12.w),
             child:  ClipRRect(
                borderRadius: BorderRadius.circular(24.r),
                child:Image.asset(
                  "assets/images/subscription3.png",
                  width:double.infinity,
                  height: 180.h.clamp(140.0, 250.0),
                  fit:BoxFit.cover,
                ),
              ),
              ),
              Padding(padding: EdgeInsets.all(14.w),child:
              ClipRRect(
                borderRadius: BorderRadius.circular(24.r),
                child:Image.asset(
                  "assets/images/subscription22.png",
                  width:double.infinity,
                  height: 120.h.clamp(100.0, 150.0),
                  fit:BoxFit.cover,
                ),
              ),
              ),
              Padding(padding: EdgeInsets.all(14.w),child:
              ClipRRect(
                borderRadius: BorderRadius.circular(24.r),
                child:Image.asset(
                  "assets/images/subscription2.png",
                  width:double.infinity,
                  height: 180.h.clamp(140.0, 250.0),
                  fit:BoxFit.cover,
                ),
              ),
              ),
              SizedBox(height: 30.h),
            ],

          ),

        ),

        ),
            ],
        ),
          )

    );
  }}