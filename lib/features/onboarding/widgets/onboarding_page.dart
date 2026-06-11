// // onboarding_page.dart
//
// import 'package:flutter/material.dart';
// class OnboardingPage extends StatelessWidget {
//   final String image;
//   final String title;
//   final String subtitle;
//   final bool isSecondScreen;
//   final bool isThirdScreen;
//   final double screenWidth;
//   final double screenHeight;
//   const OnboardingPage({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.subtitle,
//     required this.screenWidth,
//     required this.screenHeight,
//     this.isSecondScreen = false,
//     this.isThirdScreen = false,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: screenWidth * 0.05,
//       ),
//       child: Column(
//         children: [
//           SizedBox(height: screenHeight * 0.015,),
//
//           Row(
//             mainAxisAlignment:
//             MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "VOX AI",
//                 style: TextStyle(
//                   color: const Color(0xff6E8BFF),
//                   fontWeight: FontWeight.w600,
//                   fontSize: screenWidth * 0.035,
//                 ),
//               ),
//               Text(
//                 "SKIP",
//                 style: TextStyle(color: Colors.white70,
//                   fontWeight: FontWeight.w600,
//                   fontSize: screenWidth * 0.025,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: screenHeight * 0.035,),
//
//           Container(
//             width: double.infinity,
//             height:
//             isSecondScreen
//                 ? screenHeight * 0.43
//                 : screenHeight * 0.36,
//             decoration: BoxDecoration(
//               borderRadius:
//               BorderRadius.circular(28),
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   const Color(0xff141728),
//                   Colors.black.withOpacity(0.95),
//                 ],
//               ),
//               border: Border.all(
//                 color: Colors.white10,
//               ),
//             ),
//             child: ClipRRect(
//               borderRadius:
//               BorderRadius.circular(28),
//               child: Image.asset(
//                 image,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SizedBox(
//             height:
//             isSecondScreen
//                 ? screenHeight * 0.035
//                 : screenHeight * 0.05,
//
//           ),
//
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize:
//               isThirdScreen
//                   ? screenWidth * 0.12
//                   : screenWidth * 0.11,
//               height: 1.05,
//             ),
//           ),
//           SizedBox(height: screenHeight * 0.02,),
//           Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: screenWidth * 0.04,
//             ),
//             child: Text(
//               subtitle,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white70,
//                 fontSize: screenWidth * 0.034,
//                 height: 1.5,
//               ),
//             ),
//           ),
//
//             Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               dot(false),
//               dot(true),
//               dot(false),
//             ],
//          // ),
//     ),
//           SizedBox(height: screenHeight * 0.03,),
//           // if(isSecondScreen)...[
//           //   Container(
//           //     width: double.infinity,
//           //     height: screenHeight * 0.065,
//           //     decoration: BoxDecoration(
//           //       borderRadius:
//           //       BorderRadius.circular(35),
//           //       border: Border.all(
//           //         color: Colors.white10,
//           //       ),
//           //     ),
//           //     child: Center(
//           //       child: Text(
//           //         "Back",
//           //         style: TextStyle(
//           //           color: Colors.white70,
//           //           fontSize: screenWidth * 0.04,
//           //         ),
//           //       ),
//           //     ),
//           //   ),
//           //   SizedBox(height: screenHeight * 0.02,),
//           // ],
//           // Container(
//           //   width: double.infinity,
//           //   height: screenHeight * 0.07,
//           //   decoration: BoxDecoration(
//           //     borderRadius: BorderRadius.circular(35),
//           //     gradient: const LinearGradient(
//           //       colors: [
//           //         Color(0xff3B82F6),
//           //         Color(0xffC084FC),
//           //       ],
//           //     ),
//           //   ),
//             // child: Center(
//             //   child: Text(
//             //     isThirdScreen
//             //         ? "Connect Accounts"
//             //         : "Continue",
//             //     style: TextStyle(
//             //       color: Colors.white,
//             //       fontWeight: FontWeight.w500,
//             //       fontSize: screenWidth * 0.04,
//             //     ),
//             //   ),
//             // ),
//          // ),
//          //  SizedBox(height: screenHeight * 0.02,),
//          //
//          //  if(isThirdScreen)...[
//          //    Container(
//          //      width: double.infinity,
//          //      height: screenHeight * 0.065,
//          //      decoration: BoxDecoration(
//          //        borderRadius: BorderRadius.circular(35),
//          //        border: Border.all(
//          //          color: Colors.white12,
//          //        ),
//          //      ),
//          //      child: Center(
//          //        child: Text(
//          //          "Continue",
//          //          style: TextStyle(
//          //            color: Colors.white70,
//          //            fontSize: screenWidth * 0.04,
//          //          ),
//          //        )
//          //      ),
//          //    ),
//          //  ],
//          //  SizedBox(height: screenHeight * 0.03,),
//          //  Text(
//          //    "SKIP ONBOARDING",
//          //    style: TextStyle(
//          //      color: Colors.white60,
//          //      letterSpacing: 2,
//          //      fontSize: screenWidth * 0.025,
//          //    ),
//          //  ),SizedBox(height: screenHeight * 0.03,
//          //  ),
//         ],
//       ),
//     );
//   }
//   Widget dot(bool active){
//     return Container(
//       margin: const EdgeInsets.symmetric(
//         horizontal: 4,),
//       width: active ? 18 : 6,
//       height: 6,
//       decoration: BoxDecoration(
//         color:
//         active
//             ? const Color(0xffC084FC)
//             : Colors.white24,
//         borderRadius: BorderRadius.circular(20),
//       ),
//     );
//   }
// }