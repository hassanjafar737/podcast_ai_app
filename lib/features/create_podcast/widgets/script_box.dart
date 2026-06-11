import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScriptBox extends StatelessWidget {
  final String script;
  const ScriptBox({super.key, required this.script});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xff0B0F1A),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: Colors.white10,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.08),
            blurRadius: 20.w,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "• AI GENERATED SCRIPT",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    fontSize: 10.sp.clamp(9.0, 12.0),
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(20.r),
                splashColor: Colors.white24,
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Icon(
                    Icons.copy,
                    color: Colors.white54,
                    size: 18.sp.clamp(16.0, 22.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          Text(
            script.isEmpty ? "No script generated yet." : script,
            style: TextStyle(
              color: Colors.white70,
              height: 1.8,
              fontSize: 13.sp.clamp(11.0, 16.0),
            ),
          ),
        ],
      ),
    );
  }
}