import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

import '../providers/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Start fade-in animation
    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Navigate after 3 seconds
    Timer(const Duration(seconds: 4), _checkLoginStatus);
  }

  void _checkLoginStatus() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (authProvider.isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF009587), Color(0xFFFFFFFF), Color(0xFF009587)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 2),
            opacity: _opacity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // App logo
                Image.asset(
                  'assets/Smartshop.png',
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 20),

                const Text(
                  'Smart Shop',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 20),

                // ✅ Lottie Animation
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Lottie.asset('assets/lotte.json'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
