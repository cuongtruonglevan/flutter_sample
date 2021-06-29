import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_sample/shared/app_colors.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Widget leading;
  final Widget trailing;
  final Color labelColor;
  final Color backgroundColor;
  final Color borderColor;
  final bool disabled;
  final bool showLoading;
  final VoidCallback onPressed;

  const AppButton(
      {Key? key,
      required this.label,
      this.leading = const SizedBox(),
      this.trailing = const SizedBox(),
      this.labelColor = AppColors.transHistoryColor,
      this.backgroundColor = AppColors.transHistoryColor,
      this.borderColor = Colors.transparent,
      this.disabled = false,
      this.showLoading = false,
      required this.onPressed})
      : super(key: key);

  final _elevation = 0.0;
  final _borderRadius = 100.0;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: disabled ? null : onPressed,
      color: backgroundColor,
      disabledColor: backgroundColor.withOpacity(0.3),
      splashColor: labelColor.withOpacity(0.3),
      highlightColor: labelColor.withOpacity(0.3),
      elevation: _elevation,
      disabledElevation: _elevation,
      focusElevation: _elevation,
      highlightElevation: _elevation,
      hoverElevation: _elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
        side: BorderSide(color: borderColor),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: double.infinity,
        child: Visibility(
          visible: !(disabled && showLoading),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leading,
              Text(
                label,
                textAlign: TextAlign.center,
              ),
              trailing,
            ],
          ),
          replacement: Center(
            child: SizedBox(
              width: 16.0,
              height: 16.0,
              child: PlatformCircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
