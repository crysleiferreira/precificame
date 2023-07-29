import 'package:flutter/material.dart';
import 'package:precificame/app_routes.dart';
import 'package:precificame/providers/root_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
    providers: RootProvider.providers(), child: const ScaffoldExampleApp()));

class ScaffoldExampleApp extends StatelessWidget {
  const ScaffoldExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: AppRouters.routes(),
    );
  }
}
