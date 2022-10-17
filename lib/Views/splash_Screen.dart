import 'dart:async';

import 'package:corona_appfull/Views/WorldState.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const WorldState()));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: controller,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Image(image: const AssetImage('images/virus.png')),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            builder: (BuildContext context, Widget? child) {
              return Transform.rotate(
                angle: controller.value * 2.0 * math.pi,
                child: child,
              );
            },
          ),
          SizedBox(height: size.height * 0.10),
          const Text(
            'Covid-19\nTracke App',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
