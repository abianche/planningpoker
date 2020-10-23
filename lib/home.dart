import 'package:flutter/material.dart';
import 'package:planningpoker/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(L.of(context).greeting),
      ),
    );
  }
}
