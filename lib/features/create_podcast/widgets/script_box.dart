import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScriptBox extends StatefulWidget {
  final String script;

  const ScriptBox({super.key, required this.script});

  @override
  State<ScriptBox> createState() => _ScriptBoxState();
}

class _ScriptBoxState extends State<ScriptBox> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          constraints: BoxConstraints(
            maxHeight: isExpanded ? 500.h : 150.h,
          ),
          padding: EdgeInsets.all(15.w),
          decoration: BoxDecoration(
            color: const Color(0xff0B0F1A),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: Colors.white10,
            ),
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
              SizedBox(height: 10.h),
              Expanded(
                child: SingleChildScrollView(
                  physics: isExpanded 
                      ? const BouncingScrollPhysics() 
                      : const NeverScrollableScrollPhysics(),
                  child: Text(
                    widget.script.isEmpty ? "No script generated yet." : widget.script,
                    style: TextStyle(
                      color: Colors.white70,
                      height: 1.8,
                      fontSize: 13.sp.clamp(11.0, 16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isExpanded ? "Show Less" : "Read Full Script",
                  style: TextStyle(
                    color: const Color(0xff4F7CFF),
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                  ),
                ),
                Icon(
                  isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: const Color(0xff4F7CFF),
                  size: 20.sp,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
