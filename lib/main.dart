import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/quiz.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'pages/loading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Ubuntu'),
      home: LoadingScreen(),
      title: 'Εξετάσεις Ραδιοερασιτεχνίας',
      initialRoute: '/',
      routes: {
        '/quiz': (context) {
          // ignore: unused_local_variable
          final args = ModalRoute.of(context)!.settings.arguments;
          return QuizScreen();
        },
        '/home': (context) {
          // ignore: unused_local_variable
          final args = ModalRoute.of(context)!.settings.arguments;
          return HomePage();
        }
      },
    );
  }
}
