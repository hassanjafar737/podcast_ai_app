import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/features/auth/screens/login_screens.dart';
import 'package:podcast_ai_app/features/home/screens/home_screen.dart';

import '../../../core/services/navigator/navigator.dart';

class OnboardingFirst extends StatelessWidget {
  final PageController pageController;
  const OnboardingFirst({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: SingleChildScrollView(child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Column(
          children: [
            SizedBox(height: 26.h,),
            Container(
              height: 200.h,
              width: 245.w,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(10.r),
                color: Colors.white.withOpacity(0.03),
              ),
              child: Center(
                child: Image.asset(
                  "assets/images/onboarding3.png",
                  width: 220.w,
                ),
              ),
            ),
            SizedBox(height: 26.h,),
            Text(
              "Create\nPodcasts with\nAI",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 36.sp.clamp(24.0, 40.0),
                height: 1.1,
              ),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: Text(
                "Transform your scripts into professional audio productions in seconds using advanced neural generation.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 14.sp.clamp(12.0, 16.0), // Max 16px
                  height: 1.5,
                ),
              ),
            ),
            SizedBox(height: 40.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(color:Colors.transparent,child: InkWell(onTap: (){ AppRoutes.push(context,LoginScreens());},child: Text("SKIP",style: TextStyle(color: Colors.white54),),),),
   SizedBox(width: 45.w,),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                  onTap: () {
                    pageController.nextPage(
                      duration:
                      const Duration(milliseconds: 400,),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: AnimatedContainer(
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
                      SizedBox(width: 5.w,),

                      Text(
                          "NEXT",

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp.clamp(12.0, 16.0),),
                        ),
                        SizedBox(width: 5.w),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 14.sp.clamp(12.0, 16.0),
                        ),
                    ]),)
                ),)
              ],),
            // SizedBox(height: 20.h,),
          ],
        ),
      ),
      )
    );
  }
}
