import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:you_app_task/core/api/environment.dart';
import 'package:you_app_task/core/dependency_injection/service_locator.dart';
import 'package:you_app_task/core/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerServiceLocator(DevEnvironment());
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('TOKEN') ?? '';
  runApp(MyApp(
    token: token,
  ));
}

class MyApp extends StatelessWidget {
  final String token;
  const MyApp({required this.token, Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => AppRoutes.generateRoute(settings, token),
      initialRoute: token.isEmpty ? '/' : '/profile',
    );
  }
}
