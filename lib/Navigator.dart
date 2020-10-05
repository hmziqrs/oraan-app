import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'configs/theme.dart' as theme;

import 'providers/auth/provider.dart';
import 'providers/AppProvider.dart';

import 'screens/LoginScreen/LoginScreen.dart';
import 'screens/SplashScreen/Splash.dart';
import 'screens/HomeScreen/Home.dart';

class AppNavigator extends StatelessWidget {
  AppNavigator(this.observers);
  final List<NavigatorObserver> observers;
  final GlobalKey<NavigatorState> navigator = new GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: Consumer<AppProvider>(builder: (context, appState, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: this.navigator,
          navigatorObservers: observers,
          // Theme
          theme: theme.base,
          darkTheme: theme.baseDark,
          themeMode: appState.themeMode,
          // Routes
          home: SplashScreen(loading: appState.loading),
          routes: <String, WidgetBuilder>{
            "home": (ctx) => HomeScreen(),
            "login": (ctx) => LoginScreen(),
          },
        );
      }),
    );
  }
}
