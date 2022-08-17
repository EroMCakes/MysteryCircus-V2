import 'package:flutter/material.dart';
import 'package:mystery_circus_app/View/Utils/color_theme.dart';

import 'authentication/auth_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assets/Images/homeBackground.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'Je suis ?',
                  style: TextStyle(
                    fontSize: 45,
                    color: mainRedSwatch,
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 50),
                          child: Stack(
                            children: const <Widget>[
                              Image(
                                image:
                                    AssetImage('Assets/Images/buttonFrame.png'),
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 27.0),
                                  child: Text(
                                    'Equipe',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Revans',
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Container()));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 50),
                          child: Stack(
                            children: const <Widget>[
                              Image(
                                image:
                                    AssetImage('Assets/Images/buttonFrame.png'),
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 27.0),
                                  child: Text(
                                    'Game Master',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Revans',
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AuthScreen()));
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
