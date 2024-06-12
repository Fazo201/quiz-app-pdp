import 'package:flutter/material.dart';
import 'package:quiz_app/core/route/go_route_system.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouteSystem.router,
    );
  }
}