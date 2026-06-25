// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:podcast_ai_app/features/create_podcast/screens/main_create_podcast_screen.dart';
//
// import '../../../core/services/navigator/navigator.dart';
//
// class CreatePodcastScreen extends StatelessWidget{
//   const CreatePodcastScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 220.h.clamp(300.0, 450.0),
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30.r),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withOpacity(0.4),
//               blurRadius: 18,
//               spreadRadius: 1
//           )
//         ],gradient: const LinearGradient(colors: [ Color(0xff2563EB), Color(0xff7C3AED),])
//       ),
//
//       child: Stack(children: [
//       Positioned.fill(
//       child: Opacity(
//       opacity: 0.25,
//         child: ClipRRect(
//           borderRadius:
//           BorderRadius.circular(30.r),
//           child: Image.asset(
//             "assets/images/image_22e7c119.png",
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     ),
//         Padding( padding: EdgeInsets.all(20.w),
//        child:  Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           InkWell(
//             onTap: () {
//               AppRoutes.push(context,const MainCreatePodcastScreen());
//             },
//             child: Container(
//               height: 60.w.clamp(50.0, 80.0),
//               width: 60.w.clamp(50.0, 80.0),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle, color: Colors.white.withOpacity(0.12),
//               ),
//               child: Center(
//                 child: Container(
//                   height: 35.w.clamp(30.0, 50.0),
//                   width: 35.w.clamp(30.0, 50.0),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle, color: Colors.white.withOpacity(0.9),
//                   ),
//                   child: Icon(Icons.add,color: const Color(0xff2563EB), size: 20.sp.clamp(18.0, 26.0),),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 12.h,),
//           Text("Create New Podcast",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white, fontSize: 18.sp.clamp(16.0, 24.0)),),
//           SizedBox(height: 8.h,),
//           Text("Harness the power of VOX AI to generate scripts, voices, and immersive soundscapes in seconds",
//             maxLines: 3,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(color: Colors.white60, fontSize: 12.sp.clamp(10.0, 14.0)),
//           ),
//           SizedBox(height: 20.h,),
//           SizedBox(
//             width: 150.w.clamp(130.0, 200.0),
//             height: 90.h.clamp(40.0, 55.0),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white,elevation: 8,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16.r),
//                 ),),
//               onPressed: (){
//                 AppRoutes.push(context,const MainCreatePodcastScreen());
//               },
//               child: Text("Start Creating",style: TextStyle( fontSize: 14.sp.clamp(12.0, 16.0),
//                 fontWeight: FontWeight.w800,
//                 letterSpacing: .5,
//                 color: const Color(0xff030712),),)),)
//
//         ]),
//         )])
//
//     );
//   }
//
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/features/create_podcast/screens/main_create_podcast_screen.dart';

import '../../../core/services/navigator/navigator.dart';

class CreatePodcastScreen extends StatelessWidget {
  const CreatePodcastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff1E3A8A),
            Color(0xff4C1D95),
            Color(0xff7C3AED),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff7C3AED).withOpacity(.30),
            blurRadius: 35,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32.r),
              child: Opacity(
                opacity: .40,
                child: Image.asset(
                  "assets/images/homescreen.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.r),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withOpacity(.45),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                InkWell(
                  onTap: () {
                    AppRoutes.push(
                      context,
                      const MainCreatePodcastScreen(),
                    );
                  },
                  child: Container(
                    width: 60.w,
                    height: 60.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.r),
                      color: Colors.white.withOpacity(.08),
                      border: Border.all(
                        color: Colors.white.withOpacity(.15),
                      ),
                    ),
                    child: Icon(
                      Icons.graphic_eq,
                      color: const Color(0xffC084FC),
                      size: 30.sp,
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                Text(
                  "Create New Podcast",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.sp,
                    height: 1.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                SizedBox(height: 16.h),

                Text(
                  "Transform your ideas into engaging podcasts with AI",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15.sp,
                    height: 1.5,
                  ),
                ),

                SizedBox(height: 25.h),

                SizedBox(
                  width: 220.w,
                  height: 60.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 12,
                      shadowColor: Colors.white.withOpacity(.35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.r),
                      ),
                    ),
                    onPressed: () {
                      AppRoutes.push(
                        context,
                        const MainCreatePodcastScreen(),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Start Creating",
                          style: TextStyle(
                            color: const Color(0xff030712),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Icon(
                          Icons.arrow_forward,
                          color: const Color(0xff030712),
                          size: 22.sp,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}