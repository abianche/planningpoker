import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planningpoker/router.dart';

class NotFoundScreen extends StatelessWidget {
  final String? name;
  const NotFoundScreen({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !kIsWeb && Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(AppLocalizations.of(context)!.pageNotFound),
            ),
            child: Body(name: name),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.pageNotFound),
            ),
            body: Body(name: name),
          );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(Routes.home);
            },
            icon: const Icon(
              Icons.home,
              size: 32.0,
            ),
            label: const Text(
              "Home",
              textScaleFactor: 2.0,
            ),
          ),
          const SizedBox(height: 5),
          Opacity(
            opacity: 0.5,
            child: Text(
              '404 : $name',
            ),
          ),
        ],
      ),
    );
  }
}
