import 'package:flutter/material.dart';
import 'package:library_app/landing_page.dart';
import 'package:library_app/sign_up.dart';
import 'package:library_app/log_in.dart';
import 'package:library_app/home_page.dart';
import 'package:library_app/profile_page.dart';
import 'package:library_app/edit_profile.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/landing',
      routes: {
        '/landing': (context) => const LandingPage(),
        '/signUp' : (context) => const SignUp(),
        '/login' : (context) => const LogIn(),
        '/homePage': (context) => const HomePage(),
        '/profile' : (context) => const ProfilePage(),
        '/editProfile' : (context) => const EditProfile(),
        
      },
      title: 'My Library App',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primarySwatch: Colors.green, 
      ),
      home: const LandingPage(), 
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return LandingPage();
  }
}