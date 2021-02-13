import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotFoundScreen extends StatelessWidget {
  final String name;
  const NotFoundScreen({
    Key key,
    @required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(AppLocalizations.of(context).pageNotFound),
            ),
            child: Center(
              child: Text('404 : $name'),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context).pageNotFound),
            ),
            body: Center(
              child: Text('404 : $name'),
            ),
          );
  }
}
