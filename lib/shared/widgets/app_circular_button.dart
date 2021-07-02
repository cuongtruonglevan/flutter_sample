import 'package:flutter/material.dart';
import 'package:flutter_sample/shared/app_colors.dart';

class AppCircularButton extends StatelessWidget {
  const AppCircularButton(
      {Key? key, required this.child, required this.onPressed})
      : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero, elevation: 20.0, shape: CircleBorder()),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.greyButtonColor,
                  AppColors.darkGreyButtonColor
                ]),
            borderRadius: BorderRadius.circular(100.0)),
        child: child,
      ),
    );
  }
}
