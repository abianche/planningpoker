import 'package:flutter/material.dart';
import 'package:planningpoker/generated/l10n.dart';

class NotFoundScreen extends StatelessWidget {
  final String name;
  const NotFoundScreen({
    Key key,
    @required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L.of(context).pageNotFound),
      ),
      body: Center(
        child: Text('404 : $name'),
      ),
    );
  }
}
