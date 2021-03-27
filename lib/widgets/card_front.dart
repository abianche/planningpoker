import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planningpoker/models/deck.model.dart';

class CardFront extends StatelessWidget {
  const CardFront({
    Key? key,
    required this.deck,
  }) : super(key: key);

  final Deck deck;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              'assets/images/' + deck.deckImage,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
            ),
            Align(
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Text(
                  AppLocalizations.of(context)!.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Theme.of(context).textTheme.headline5!.fontSize,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              alignment: const FractionalOffset(0.5, 0.15),
            ),
            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context)!.tapToReveal,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              alignment: const FractionalOffset(0.5, 0.95),
            ),
          ],
        ),
      ),
    );
  }
}
