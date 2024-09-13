import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/sign_up.dart';
import 'pages/home.dart';
import 'pages/brew_guide.dart';
import 'pages/kopi_library.dart';
import 'pages/kopi_journal.dart';
import 'pages/user_profile.dart';
import 'pages/iced_latte_detail.dart';
import 'pages/salted_caramel_detail.dart';
import 'pages/french_press_detail.dart'; // Import FrenchPressDetailPage

void main() {
  runApp(KopiApp());
}

class KopiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KOPI App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: 'Lato',
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/sign_up': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
        '/brew_guide': (context) => BrewGuidePage(),
        '/kopi_library': (context) => KopiLibraryPage(),
        '/kopi_journal': (context) => KopiJournalPage(),
        '/user_profile': (context) => UserProfilePage(),
        '/iced_latte_detail': (context) =>
            IcedLatteDetailPage(), // Updated to match the route in KopiLibraryPage
        '/salted_caramel_detail': (context) =>
            SaltedCaramelDetailPage(), // Updated to match the route in KopiLibraryPage
        '/french_press': (context) => FrenchPressDetailPage(), // Add this route
      },
    );
  }
}
