import 'package:flutter/material.dart';
import 'package:projectinitial/presentation/pages/splash/splash_second_page.dart';

import '../../../utils/resources/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  const SplashScreen({Key? key, required this.toggleTheme}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => SecondarySplashScreen(
            toggleTheme: widget.toggleTheme,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(ImagePaths.logo),
      ),
    );
  }
}
