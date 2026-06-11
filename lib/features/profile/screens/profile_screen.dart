import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/core/widgets/bottom_nav_bar.dart';
import 'package:podcast_ai_app/features/auth/screens/login_screens.dart';
import 'package:podcast_ai_app/features/profile/widgets/card.dart';
import 'package:podcast_ai_app/features/profile/widgets/profile_header.dart';
import 'package:podcast_ai_app/features/profile/widgets/setting_card.dart';
import 'package:podcast_ai_app/features/subsciptions/screens/subscription_screen.dart';

import '../../../core/services/navigator/navigator.dart';
import '../../settings/screen/app_setting_screen.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff050816),
        bottomNavigationBar:Padding(
          padding: EdgeInsets.only(
            left: 14.w,
            right: 14.w,
            bottom: 30.h,
          ),
          child: const BottomNavbar(selectedIndex: 4,),),
        body: SafeArea(child: Column(children: [Padding(
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
            // SizedBox(height: screenHeight *0.015,),
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
              ProfileHeader(icon: Icons.settings_outlined, onTap: () {AppRoutes.push(context,const AppSettingScreen()); },),
              SizedBox(width: 8.w,),

            ],
          ),
        ),  Divider(color: Colors.white10, height: 1.h,),
          Expanded(
            child: SingleChildScrollView(
            child: Column(
              children: [
                PremiumMemberCard(image:"assets/images/myimg.jpg", ),
                    Container(
                      margin: EdgeInsets.all(22.w),
                      width: double.infinity,
                      height: 55.h.clamp(45.0, 65.0),
                       decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                         gradient: const LinearGradient(colors:[Color(0xff2563EB),
                           Color(0xffC084FC),])

                       ),
                      child:  InkWell(onTap: (){
                        AppRoutes.push(context,const SubscriptionScreen());
                        },child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.workspace_premium_outlined,
                              color:Colors.black45,
                              size: 24.sp.clamp(20.0, 30.0),
                            ),
                            Text(
                              "Manage Subscription",
                              style:TextStyle(
                                color:Colors.black45,
                                fontSize: 16.sp.clamp(14.0, 18.0),
                              ),
                            ),
                            SizedBox(width: 40.w),
                            Icon(
                              Icons.open_in_new,
                              color:Colors.black45,
                              size: 16.sp.clamp(14.0, 20.0),
                            ),
                  ],)
                )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  width: double.infinity,
                  height: 120.h.clamp(100.0, 150.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.2),
                    blurRadius: 6,
                    spreadRadius: 0,
                    offset: const Offset(0, 2),)],
                    borderRadius: BorderRadius.circular(26.r),
                    border: Border.all(color: Colors.black12)
                  ),
               child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/icons.png",width: 30.w.clamp(24.0, 40.0),),
                    Text("12",style: TextStyle(
                      fontWeight:FontWeight.bold,fontSize: 26.sp.clamp(20.0, 32.0),color: const Color(0xffC4B5FD),),),
                    Text("PODCASTS CREATED",style: TextStyle(
                      fontWeight:FontWeight.bold,fontSize: 12.sp.clamp(10.0, 14.0),color: Colors.white,),),
                  ],
                )
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    width: double.infinity,
                    height: 110.h.clamp(90.0, 140.0),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.2),
                          blurRadius: 6,
                          spreadRadius: 0,
                          offset: const Offset(0, 2),)],
                        borderRadius: BorderRadius.circular(26.r),
                        border: Border.all(color: Colors.black12)
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.signal_cellular_alt,
                          color: Color(0xffC4B5FD),
                        ),
                        SizedBox(height: 8.h,),
                        Text("45K",style: TextStyle(
                          fontWeight:FontWeight.bold,fontSize: 24.sp.clamp(18.0, 30.0),
                          color: const Color(0xffC4B5FD),),),
                        Text("TOTAL LISTENS",style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 12.sp.clamp(10.0, 14.0),color: Colors.white,),),
                      ],
                    )
                ),
                SizedBox(height: 15.h,),
              Padding(padding: EdgeInsets.all(16.w),child:
              Align(alignment: Alignment.centerLeft,
                child:
                 Text("Account Settings",style: TextStyle(color: Colors.white,
                     fontWeight:FontWeight.bold,fontSize: 22.sp.clamp(18.0, 26.0)),),
              )),
                // SizedBox(height: screenHeight * 0.025),
                SettingCard(icon: Icons.person_outline, title: "Edit Profile",
                    subtitle:"Update bio, avatar, and social links", onTap: (){}),
                SettingCard(icon: Icons.credit_card, title: "Billing and Plan",
                    subtitle:"Manage your Premium subscription",
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>const SubscriptionScreen()));}),
                SettingCard(icon: Icons.volume_up_outlined, title: "Audio Quality",
                    subtitle:"Configure AI voice bitrate and output\nformat", onTap: (){}),
                Container(
                  margin: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.r),
                    border: Border.all(
                      color: Colors.orange.withOpacity(0.4),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>const LoginScreens()));
                          },
                          icon:const Icon(Icons.logout,
                            color: Colors.orange,),

                        ),Text(
                          "Sign Out",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp.clamp(12.0, 16.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          )

          )],))
    );
  }
}