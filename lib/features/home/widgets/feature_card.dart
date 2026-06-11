import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeatureCard extends StatelessWidget{
  final String title;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;
  const FeatureCard({required this.onTap,super.key,required this.icon,required this.title,required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.circular(37.r),
          onTap: onTap,
          splashColor: Colors.white10,
            highlightColor: Colors.white10,
            child:  Container(
                height: 100.h.clamp(80.0, 120.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36.r),
        border: Border.all(color:  Colors.white10,)
      ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,color: iconColor,size: 24.sp.clamp(20.0, 30.0),),
        SizedBox(height: 10.h,),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp.clamp(12.0, 16.0),
                  ),
                )
        ])
            )     )
    );
  }
}