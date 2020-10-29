import 'package:flutter/material.dart';
import 'package:planningpoker/models/player.model.dart';
import 'package:planningpoker/widgets/card_back_mini.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    Key key,
    @required this.roomId,
    @required this.userName,
    @required this.player,
  }) : super(key: key);

  final String roomId;
  final String userName;
  final Player player;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          userName != player.username
              ? Text(
                  player.username,
                  textScaleFactor: 1.25,
                )
              : Tooltip(
                  message: "This is you!",
                  child: Text(
                    player.username,
                    textScaleFactor: 1.25,
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
          player.isReady()
              ? CardBackMini(card: player.currentCard)
              : Center(
                  child: userName != player.username
                      ? const CircularProgressIndicator() // SpinKitThreeBounce(color: color)
                      : Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            Opacity(opacity: 0.25, child: CardBackMini(card: player.currentCard?.substring(1))),
                          ],
                        ),
                ),
          Container()
        ],
      ),
    );
  }
}
