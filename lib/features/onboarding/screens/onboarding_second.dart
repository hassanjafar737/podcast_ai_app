
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
    return  SafeArea(
        child: Column(
          children: [

            SizedBox(height: 20),

            Text(
              "VOX AI",
              style: TextStyle(
                fontSize: 34.sp,
                shadows: [
                  Shadow(
                    color: Color(0xff7DD3FC),
                    blurRadius: 20,
                  ),
                ],
                fontWeight: FontWeight.w800,
                color: Color(0xff7DD3FC),
              ),
            ),

            SizedBox(height: 20),

             Container(
                margin: EdgeInsets.symmetric(horizontal: 18.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0xff060B2D),
                ),
                child: Column(
                  children: [

                    SizedBox(height: 25),

                    Stack(
                      children: [

                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.r),
                          child: Image.asset(
                            "assets/images/onboard786.png",
                            width: double.infinity,
                            height: 260.h,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Positioned(
                          left: 20.w,
                          top: 20.h,
                          child: Container(
                            width: 50.w,
                            height: 50.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xff111827),
                              border: Border.all(
                                color: const Color(0xffC084FC),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xffC084FC)
                                      .withOpacity(.4),
                                  blurRadius: 20,
                                )
                              ],
                            ),
                            child: const Icon(
                              Icons.graphic_eq,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        Positioned(
                          right: 20.w,
                          top: 20.h,
                          child: Container(
                            width: 50.w,
                            height: 50.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xff111827),
                              border: Border.all(
                                color: const Color(0xffC084FC),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xffC084FC)
                                      .withOpacity(.4),
                                  blurRadius: 20,
                                )
                              ],
                            ),
                            child: const Icon(
                              Icons.mic,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),

                    Text(
                      "Natural AI Voices",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          colors: [
                            Color(0xff3B82F6),
                            Color(0xffC084FC),
                          ],
                        ).createShader(bounds);
                      },
                      child: Text(
                        "AI Voices",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Choose from hundreds of hyper-realistic voices in multiple languages and tones.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          height: 1.6,
                        ),
                      ),
                    ),

                    SizedBox(height: 30),

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        featureCard(
                          Icons.language,
                          "Multiple\nLanguages",
                        ),
                        featureCard(
                          Icons.auto_awesome,
                          "Hyper\nRealistic",
                        ),
                        featureCard(
                          Icons.graphic_eq,
                          "Natural\nTones",
                        ),
                        featureCard(
                          Icons.flash_on,
                          "Instant\nGeneration",
                        ),
                      ],
                    ),

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
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 25.h,
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
                        )],),
                    SizedBox(height: 25),



          ]
        )
    )]

    ) );

  }
  Widget featureCard(
      IconData icon,
      String title,
      ) {
    return Container(
      width: 80.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: const Color(0xff0B1228),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff7C3AED)
                .withOpacity(.2),
            blurRadius: 15,
          ),
        ],
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Color(0xff7C3AED),
        ),
      ),
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Color(0xffC084FC),
          ),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }


}