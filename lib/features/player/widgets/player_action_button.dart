// import 'package:flutter/material.dart';
//
// class PlayerActionButton extends StatelessWidget{
//
//   final IconData icon;
//   final String title;
//   final VoidCallback onTap;
//
//   const PlayerActionButton({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context){
//
//     final screenWidth=MediaQuery.of(context).size.width;
//
//     return Material(
//       color:Colors.transparent,
//       child:InkWell(
//         borderRadius:BorderRadius.circular(18),
//         splashColor:Colors.white10,
//         highlightColor:Colors.white10,
//         onTap:onTap,
//         child:Padding(
//           padding:const EdgeInsets.symmetric(horizontal:10,vertical:6),
//           child:Column(
//             mainAxisSize:MainAxisSize.min,
//             children:[
//               Icon(icon,color:Colors.white70,size:20),
//               SizedBox(height:6),
//               Text(title,style:TextStyle(color:Colors.white54,fontSize:screenWidth*0.022,fontWeight:FontWeight.w600)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayerActionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const PlayerActionButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18.r),
        splashColor: Colors.white10,
        highlightColor: Colors.white.withOpacity(0.02),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white70, size: 22.sp.clamp(18.0, 26.0)),
              SizedBox(height: 8.h),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 10.sp.clamp(8.0, 12.0),
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}