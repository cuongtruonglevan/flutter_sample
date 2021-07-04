import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppToggleButton extends StatelessWidget {
  AppToggleButton({
    Key? key,
    required this.child,
    required this.gradient,
    required this.reverseGradient,
    required this.onPressed,
    required this.selected,
  }) : super(key: key);
  final Widget child;
  final LinearGradient gradient;
  final LinearGradient reverseGradient;
  final VoidCallback? onPressed;
  final RxBool selected;

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
      child: Obx(
        () => Ink(
          height: 44.w,
          decoration: BoxDecoration(
            gradient: selected.value ? reverseGradient : gradient,
            borderRadius: BorderRadius.circular(100.0),
            border: Border.all(
                color: selected.value
                    ? AppColors.redButtonColor
                    : AppColors.backgroundColor),
          ),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
