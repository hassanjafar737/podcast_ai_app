// onboarding_second.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/services/navigator/navigator.dart';
import '../../auth/screens/login_screens.dart';
import '../../home/screens/home_screen.dart';

class OnboardingSecond extends StatelessWidget {

  final PageController pageController;

  const OnboardingSecond({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
   child:SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Column(
          children: [
            // SizedBox(height: 30.h,),
            Text(
              "VOX AI",
              style: TextStyle(
                color: const Color(0xff5B8CFF),
                fontWeight: FontWeight.bold,
                fontSize: 36.sp.clamp(24.0, 36.0),

              ),

            ),

            SizedBox(height: 15.h,),
            Container(
              height: 200.h.clamp(150.0, 300.0),
              width: 260.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: const Color(0xff0B0F1A),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.25),
                    blurRadius: 50,
                    spreadRadius: 2,
                  ),
                ],

              ),

              child: Stack(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.r),
                      child: Image.asset(
                        "assets/images/onboard.png",
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    ),

                  ),
                  Positioned(
                    top: 12.h,
                    right: 12.w,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(40.r),
                        onTap: () {},
                        child: Container(
                          width: 45.w.clamp(35.0, 55.0),
                          height: 45.w.clamp(35.0, 55.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black54,
                          ),
                          child: Icon(
                            Icons.mic,
                            color: Colors.white,
                            size: 20.sp.clamp(16.0, 24.0),
                          ),

                        ),

                      ),

                    ),

                  ),
                  Positioned(
                    left: 12.w,
                    bottom: 12.h,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(40.r),
                        onTap: () {},
                        child: Container(
                          width: 45.w.clamp(35.0, 55.0),
                          height: 45.w.clamp(35.0, 55.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black54,
                          ),
                          child: Icon(
                            Icons.graphic_eq,
                            color: Colors.white,
                            size: 20.sp.clamp(16.0, 24.0),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],

              ),

            ),

            SizedBox(height: 30.h,),

             Column(

                children: [
                  Text(
                    "Natural AI Voices",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 26.sp.clamp(20.0, 30.0),
                    ),

                  ),

                  SizedBox(height: 15.h,),
                  Text(
                    "Choose from hundreds of hyper-realistic voices in multiple languages and tones.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 14.sp.clamp(12.0, 16.0),
                      height: 1.6,
                    ),

                  ),
             SizedBox(height: 100.h,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Material(color:Colors.transparent,child: InkWell(onTap: (){ AppRoutes.push(context,LoginScreens());},child: Text("SKIP",style: TextStyle(color: Colors.white54),),),),
                        SizedBox(width: 45.w,),

                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(40.r),
                      onTap: () {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 400,),
                          curve: Curves.easeInOut,
                        );

                      },
                      child:AnimatedContainer(
                        duration: const Duration(seconds: 1,),
                        width: 100.w.clamp(80.0, 150.0),
                        height: 45.h.clamp(40.0, 60.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.r),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff3B82F6),
                              Color(0xffC084FC),
                            ],

                          ),

                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(
                              "NEXT",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,

                                letterSpacing: 1,

                                fontSize: 14.sp.clamp(12.0, 16.0),

                              ),

                            ),

                            SizedBox(width: 8.w),

                            Icon(

                              Icons.arrow_forward,

                              color: Colors.white,

                              size: 18.sp.clamp(16.0, 22.0),

                            ),

                          ],

                        ),

                      ),

                    ),

                  ),

            ])

                ],

              ),

      ])
      ),



        ),

    );
  }


}