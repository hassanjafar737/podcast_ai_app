import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderIcon extends StatelessWidget{

  final IconData icon;
  final VoidCallback onTap;

  const HeaderIcon({
    super.key,
    required this.icon,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context){
    return Material(
      color:Colors.transparent,
      child:InkWell(
        borderRadius:BorderRadius.circular(20.r),
        splashColor:Colors.white24,
        onTap:onTap,
        child:Container(
          padding: EdgeInsets.all(6.w),
          child:Icon(
            icon,
            color:Colors.white70,
            size: 20.sp.clamp(18.0, 24.0),
          ),
        ),

      ),
    );
  }
}