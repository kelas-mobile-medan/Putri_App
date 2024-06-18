import 'package:flutter/material.dart';
import 'screens/sign_in_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'home_page.dart'; // Import home_page.dart
import 'profile_page.dart'; // Import profile_page.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SignInScreen(),
        '/signUp': (context) => SignUpScreen(),
        '/forgotPassword': (context) => ForgotPasswordScreen(),
        '/home': (context) => MyHomePage(title: 'Home Page App'), // Tambahkan rute untuk home page
        '/profile': (context) => ProfilePage(), // Tambahkan rute untuk profile page
      },
    );
  }
}
