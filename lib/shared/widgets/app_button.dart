import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.child,
    required this.gradient,
    required this.onPressed,
  }) : super(key: key);
  final Widget child;
  final LinearGradient gradient;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        elevation: 10.0,
        shadowColor: Colors.black.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
      child: Ink(
        height: 44.w,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 2.w),
            child: child,
          ),
        ),
      ),
    );
  }
}
