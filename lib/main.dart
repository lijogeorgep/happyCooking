import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happy_cooking/BottomNavigation.dart';
import 'package:happy_cooking/flashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
  //SystemChrome.setEnabledSystemUIOverlays([]);
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: []);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Happy Cooking',
      initialRoute: '/',
      routes: appRoutes(),
    );
  }

  Map<String, WidgetBuilder> appRoutes() {
    return <String, WidgetBuilder>{
      '/': (context) => const FlashScreen(),
      '/bottomNavigation': (context) => const BottomNavigation(),
    };
  }
}
