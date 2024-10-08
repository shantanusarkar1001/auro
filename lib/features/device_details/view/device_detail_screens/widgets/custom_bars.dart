import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({super.key,
    required this.max,
    required this.value});

  final int max,value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(max, (index) {
        return Container(
          margin:  EdgeInsets.symmetric(horizontal: 2.0.w),
          width: 5.w,
          height: 35.h,
          decoration: BoxDecoration(
            color: index < value
                ? const Color(0xFFFF6A00) // Bright orange color
                : const Color(0xFF8A4E3E), // Darker brown color
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}