import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

PageRoute defaultPageRoute(BuildContext context, RouteSettings settings) =>
    platformPageRoute(
      context: context,
      settings: settings,
      builder: (context) => Container(),
    );