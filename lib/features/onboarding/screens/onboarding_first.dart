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
            SizedBox(height: 30.h,),

            Text(
              "VOX AI",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w800,
                color: Color(0xff7DD3FC),
              ),
            ),
            SizedBox(height: 17.h,),
            Container(
              width: 180.w,
              height: 180.w,
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xffC084FC),
                    Color(0xff3B82F6),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                    const Color(0xff8B5CF6)
                        .withOpacity(.45),
                    blurRadius: 50,
                  ),
                ],
              ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24)
                    ,child: Image.asset(
                      
                  "assets/images/onboardi12.png",
                   fit: BoxFit.cover,
                    )
            )
              ),

            SizedBox(height: 26.h,),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [

                  TextSpan(
                    text:"Create\n",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:38.sp,
                      fontWeight:FontWeight.w800,
                    ),
                  ),

                  TextSpan(
                    text:"Studio-Quality\n",
                    style: TextStyle(
                      color: const Color(0xffC084FC),
                      fontSize:38.sp,
                      fontWeight:FontWeight.w800,
                    ),
                  ),

                  TextSpan(
                    text:"Podcasts with AI",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:38.sp,
                      fontWeight:FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child:Text(
                "Transform ideas into studio-quality podcasts with AI voices, smart scripting, and professional audio production.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize:15.sp,
                  height:1.6,
                ),
              ),
            ),
            SizedBox(height: 120.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(color:Colors.transparent,
                  child: InkWell(onTap: (){
                    AppRoutes.push(context,LoginScreens());},
                    child: Text("SKIP",style: TextStyle(color: Colors.white54),),),),

                Spacer(),
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
                    width: 140.w.clamp(80.0, 150.0),
                    height: 55.h.clamp(40.0, 60.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.r),
                      boxShadow:[
                        BoxShadow(
                          color:
                          const Color(0xff8B5CF6)
                              .withOpacity(.45),
                          blurRadius:30,
                        ),
                      ],

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
