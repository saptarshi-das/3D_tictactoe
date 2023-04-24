// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'gamepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _showWelcomeScreen = true;

  @override
  void initState() {
    super.initState();
    _checkIfFirstTime();
  }

  void _checkIfFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool showWelcomeScreen = (prefs.getBool('showWelcomeScreen') ?? true);

    setState(() {
      _showWelcomeScreen = showWelcomeScreen;
    });

    if (!_showWelcomeScreen) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GamePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_showWelcomeScreen) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to My App',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _setWelcomeScreenShown();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const GamePage()),
                    );
                  },
                  child: const Text('Get Started'),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  void _setWelcomeScreenShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showWelcomeScreen', false);
  }
}