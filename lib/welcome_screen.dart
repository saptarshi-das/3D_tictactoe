// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'gamepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:show_up_animation/show_up_animation.dart';

int _currentIndex = 0;

final List<ImageData> images = [
  ImageData(imageLocation: 'images/boring.png',  description: "Playing regular 2D tic-tac-toe is like watching paint dry, it's time to level up and add some dimension to your game!",    ),
  ImageData(imageLocation: 'images/intro.png',   description: 'Take your tic-tac-toe skills to the next level with 3D and add a new dimension to your strategy!',    ),
  ImageData(imageLocation: 'images/howplay.png', description: 'Outmaneuver your opponent in a game of 3D tic-tac-toe and conquer the space',    ),  ];
class ImageData {
  final String imageLocation;
  final String description;

  ImageData({ required this.imageLocation, required this.description});
}

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
        backgroundColor: Color(0xFFFFFFFF),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: images.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Card(
                        elevation: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 500,
                              height: 300,
                              child: ShowUpAnimation(
                                delayStart: const Duration(seconds:0),
                                animationDuration: Duration(seconds: 1),
                                curve: Curves.bounceIn,
                                direction: Direction.vertical,
                                offset: 0.5,
                                child: Image.asset(images[index].imageLocation,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            ShowUpAnimation(
                              delayStart: const Duration(seconds:0),
                              animationDuration: Duration(seconds: 1),
                              curve: Curves.bounceIn,
                              direction: Direction.vertical,
                              offset: 0.5,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  images[index].description,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Carlito',
                                      fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: DotsIndicator(
                  dotsCount: images.length,
                  position: _currentIndex.toDouble(),
                  decorator: const DotsDecorator(
                    activeColor: Colors.blue,
                    size: Size.square(8),
                    activeSize: Size.square(12),
                  ),
                ),
              ),
            ],
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



// PUT this in the end of the welcome screen

//ElevatedButton(
//onPressed: () {
//_setWelcomeScreenShown();
//Navigator.pushReplacement(
//context,
//MaterialPageRoute(builder: (context) => const GamePage()),
//);
//},
//child: const Text('Get Started'),
//),