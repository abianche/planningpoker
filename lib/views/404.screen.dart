import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  final String name;
  const NotFoundScreen({
    Key key,
    @required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('404 : $name'),
      ),
    );
  }
}
