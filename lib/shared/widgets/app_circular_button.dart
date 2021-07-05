import 'package:flutter/material.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCircularButton extends StatelessWidget {
  const AppCircularButton(
      {Key? key, required this.child, required this.onPressed})
      : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          side: BorderSide.none,
          padding: EdgeInsets.zero,
          shape: CircleBorder()),
      child: Container(
        decoration: BoxDecoration(
            gradient: AppColors.greyGradient,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 20.w,
                spreadRadius: 5.w,
                offset: Offset(5.w, 5.w),
                color: Colors.black.withOpacity(0.4),
              ),
              BoxShadow(
                blurRadius: 20.w,
                spreadRadius: 7.w,
                offset: Offset(-7.w, -7.w),
                color: AppColors.borderColor.withOpacity(0.2),
              ),
            ]),
        child: child,
      ),
    );
  }
}
