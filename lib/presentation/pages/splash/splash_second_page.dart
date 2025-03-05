import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:projectinitial/utils/resources/locale_text.dart';

import '../homepage/homepage.dart';

class SecondarySplashScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  const SecondarySplashScreen({Key? key, required this.toggleTheme})
      : super(key: key);

  @override
  _SecondarySplashScreenState createState() => _SecondarySplashScreenState();
}

class _SecondarySplashScreenState extends State<SecondarySplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomePage(
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
        child: Text(
          LocaleText.welcome,
          style: Theme.of(context).textTheme.headlineLarge,
        ).tr()
      ),
    );
  }
}
