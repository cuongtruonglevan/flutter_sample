import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/models/model.dart';
import 'package:flutter_sample/screens/auth/auth_bloc.dart';
import 'package:flutter_sample/shared/routes/app_routes_factory.dart';
import 'package:flutter_sample/shared/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({Key? key, required this.sharedPreferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(sharedPreferences),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          Widget _child;
          if (state is Authenticated) {
            _child = _buildFeaturesApp(context, state.user);
          } else {
            _child = Container();
          }
          return AnimatedSwitcher(
            child: _child,
            switchInCurve: Curves.easeInCirc,
            switchOutCurve: Curves.easeOutCirc,
            duration: Duration(milliseconds: 250),
          );
        },
      ),
    );
  }

  Widget _buildFeaturesApp(BuildContext context, User user) {
    final _routesFactory = AppRoutesFactory(sharedPreferences, user);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: ScreenUtilInit(
        designSize: Size(375, 667),
        builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: _routesFactory.navigatorKey,
          onGenerateRoute: (settings) =>
              _routesFactory.generateRoute(context, settings),
          initialRoute: Routes.home,
        ),
      ),
    );
  }
}
