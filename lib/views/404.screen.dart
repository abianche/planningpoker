import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class NotFoundScreen extends StatelessWidget {
  final String name;
  const NotFoundScreen({
    Key key,
    @required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(AppLocalizations.of(context).pageNotFound),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text('404 : $name'),
      ),
    );
  }
}
