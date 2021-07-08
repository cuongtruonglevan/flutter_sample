import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    return Container(
      width: 120.w,
      height: 40.w,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(100.0),
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
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
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
        child: Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 2.w),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class AppInfiniteButton extends StatelessWidget {
  const AppInfiniteButton(
      {Key? key,
      required this.child,
      required this.gradient,
      required this.onPressed})
      : super(key: key);
  final Widget child;
  final LinearGradient gradient;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        padding: EdgeInsets.zero,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
      child: Container(
        height: 44.w,
        decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(100.0),
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
    );
  }
}
