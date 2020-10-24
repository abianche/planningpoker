import 'package:flutter/material.dart';
import 'package:planningpoker/router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => {Navigator.of(context).pushReplacementNamed(Routes.home)},
          child: Text("go to home"),
        ),
      ),
    );
  }
}
