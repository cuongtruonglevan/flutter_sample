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
    return SizedBox(
      height: 44.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          padding: EdgeInsets.zero,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
        child: Obx(
          () => Container(
            height: 44.w,
            decoration: BoxDecoration(
                gradient: selected.value ? reverseGradient : gradient,
                borderRadius: BorderRadius.circular(100.0),
                border: Border.all(
                    color: selected.value
                        ? AppColors.redButtonColor
                        : Colors.transparent),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x33505d74),
                    blurRadius: 20,
                    offset: Offset(-7, -7),
                  ),
                  BoxShadow(
                    color: Color(0x66000000),
                    blurRadius: 20,
                    offset: Offset(5, 5),
                  ),
                ]),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 2.w),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
