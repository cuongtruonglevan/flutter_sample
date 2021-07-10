import 'package:flutter/material.dart';
import 'package:flutter_sample/shared/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppCheckBox extends StatelessWidget {
  AppCheckBox({Key? key, required this.value}) : super(key: key);

  final RxBool value;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: 20.w,
        height: 20.w,
        decoration: BoxDecoration(
            gradient: AppColors.redGradient, shape: BoxShape.circle),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            minimumSize: MaterialStateProperty.all(Size(0.0, 0.0)),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            foregroundColor: MaterialStateProperty.all(Colors.transparent),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () => value.value = !value.value,
          child: Center(
            child: Visibility(
              visible: value.value,
              child: Padding(
                padding: EdgeInsets.only(bottom: 1.w),
                child: Icon(
                  Icons.check,
                  color: AppColors.ffd7dde8,
                  size: 12.w,
                ),
              ),
              replacement: Container(
                width: 18.w,
                height: 18.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.ff252c39),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
