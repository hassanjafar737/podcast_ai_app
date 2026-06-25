
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/features/auth/screens/signup_screen.dart';
import 'package:podcast_ai_app/features/home/screens/home_screen.dart';
import '../../../core/services/navigator/navigator.dart';
import '../../auth/screens/login_screens.dart';

class OnboardingThird extends StatelessWidget {

  final PageController pageController;

  const OnboardingThird({
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
            Center(
              child: Text(
                "VOX AI",
                style: TextStyle(
                  color: const Color(0xff5B8CFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 36.sp.clamp(28.0, 42.0),
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Container(
              height: 200.h.clamp(150.0, 300.0),
              width: 260.w,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.r),

                color: const Color(0xff0B0F1A),

                boxShadow: [

                  BoxShadow(
                    color: Colors.blue.withOpacity(0.12),
                    blurRadius: 45,
                    spreadRadius: 4,
                  ),

                ],

              ),

              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28.r),
                  child: Image.asset(
                    "assets/images/onboarding3.png",
                    key:UniqueKey(),
                    width: 280.w.clamp(200.0, 400.0),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            SizedBox(height: 50.h,),
            Text(
              "Publish & Share",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32.sp.clamp(24.0, 40.0),
              ),
            ),
            SizedBox(height: 15.h,),

            Padding(

              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),

              child: Text(
                "Distribute your podcast to all major platforms or share directly with your audience with one tap.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 14.sp.clamp(12.0, 16.0),
                  height: 1.6,
                ),
              ),
            ),

            SizedBox(height: 58.h,),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(40.r),
                splashColor: Colors.white24,
                highlightColor: Colors.white10,
                onTap: () {
                  AppRoutes.push(context, const LoginScreens());
                },
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1,),
                  width: 300.w.clamp(80.0, 150.0),
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

                  child: Center(
                    child: Text(
                      "GET STARTED",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontSize: 14.sp.clamp(12.0, 16.0),
                      ),
                    ),),
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20.r),
                onTap: () {
                  pageController.previousPage(
                    duration:
                    const Duration(
                      milliseconds: 400,
                    ),
                    curve: Curves.easeInOut,

                  );

                },

                child: Padding(

                  padding:
                  const EdgeInsets.all(8)
                ),

              ),

            ),

          ],

        ),

      ),
     )
    );
  }
}
