import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/models/model.dart';
import 'package:flutter_sample/screens/home/home_screen.dart';
import 'package:flutter_sample/screens/home/widgets/transaction_item.dart';
import 'package:flutter_sample/screens/reload/reload_screen.dart';
import 'package:flutter_sample/screens/transaction_history/transaction_history_screen.dart';
import 'package:flutter_sample/shared/routes/routes.dart';
import 'package:flutter_sample/shared/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRoutesFactory {
  final SharedPreferences sharedPreferences;
  final User user;
  final navigatorKey = GlobalKey<NavigatorState>();

  AppRoutesFactory(this.sharedPreferences, this.user);

  Route<dynamic> generateRoute(BuildContext context, RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => HomeScreen(),
        );
      case Routes.transactionHistory:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => TransactionHistoryScreen(
              transList: settings.arguments as List<Transaction>),
        );
      case Routes.reload:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => ReloadScreen(),
        );
      default:
        return defaultPageRoute(context, settings);
    }
  }
}