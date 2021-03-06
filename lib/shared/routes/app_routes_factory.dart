import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/models/model.dart';
import 'package:flutter_sample/screens/add_payment/add_payment_screen.dart';
import 'package:flutter_sample/screens/home/home_screen.dart';
import 'package:flutter_sample/screens/home/widgets/transaction_item.dart';
import 'package:flutter_sample/screens/reload/reload_screen.dart';
import 'package:flutter_sample/screens/search_member/search_member_screen.dart';
import 'package:flutter_sample/screens/transaction_history/transaction_history_screen.dart';
import 'package:flutter_sample/screens/transfer/transfer_screen.dart';
import 'package:flutter_sample/screens/welcome/welcome_detail_screen.dart';
import 'package:flutter_sample/screens/welcome/welcome_screen.dart';
import 'package:flutter_sample/screens/withdraw/withdraw_screen.dart';
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
      case Routes.welcome:
        return PageRouteBuilder(
          pageBuilder: (context, _, __) => WelcomeScreen(),
          opaque: false,
        );
      case Routes.welcomeDetail:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => WelcomeDetailScreen(),
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
      case Routes.addPayment:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => AddPaymentScreen(),
        );
      case Routes.withdraw:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => WithdrawScreen(),
        );
      case Routes.searchMember:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => SearchMemberScreen(),
        );
      case Routes.transfer:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => TransferScreen(),
        );
      default:
        return defaultPageRoute(context, settings);
    }
  }
}
