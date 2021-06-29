import 'package:flutter/material.dart';

class RotatableWidget extends StatefulWidget {
  final Widget child;
  final bool rotate;

  RotatableWidget({this.rotate = false,required this.child});

  @override
  _RotatableWidgetState createState() => _RotatableWidgetState();
}

class _RotatableWidgetState extends State<RotatableWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController rotationController;
  late Animation<double> animation;
  late Animation<double> turns;

  @override
  void initState() {
    super.initState();
    initAnimations();
    handleAnimations();
  }

  @override
  void didUpdateWidget(RotatableWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    handleAnimations();
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(turns: turns, child: widget.child);
  }

  void initAnimations() {
    rotationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    animation = CurvedAnimation(
      parent: rotationController,
      curve: Curves.easeInOutBack,
    );
    turns = Tween(begin: 0.0, end: 0.25).animate(animation);
  }

  void handleAnimations() {
    if (widget.rotate) {
      rotationController.forward();
    } else {
      rotationController.reverse();
    }
  }
}
