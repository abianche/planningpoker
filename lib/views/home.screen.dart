import 'package:flutter/material.dart';
import 'package:planningpoker/generated/l10n.dart';
import 'package:planningpoker/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deck name"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.of(context).pushNamed(Routes.settings),
          ),
        ],
      ),
      body: Center(
        child: Text(L.of(context).greeting),
      ),
    );
  }
}
