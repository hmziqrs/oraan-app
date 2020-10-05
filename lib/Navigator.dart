import 'package:flutter/material.dart';
import 'package:oraan/screens/LoginScreen/LoginScreen.dart';
import 'package:provider/provider.dart';

import 'configs/theme.dart' as theme;

import 'providers/AppProvider.dart';

import 'screens/SplashScreen/Splash.dart';

class AppNavigator extends StatelessWidget {
  AppNavigator(this.observers);
  final List<NavigatorObserver> observers;
  final GlobalKey<NavigatorState> navigator = new GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
      create: (_) => AppProvider(),
      child: Consumer<AppProvider>(
        builder: (context, state, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: this.navigator,
            navigatorObservers: observers,
            // Theme
            theme: theme.base,
            darkTheme: theme.baseDark,
            themeMode: state.themeMode,
            // Routes
            home: LoginScreen(),
            // routes: <String, WidgetBuilder>{},
          );
        },
      ),
    );
  }
}
