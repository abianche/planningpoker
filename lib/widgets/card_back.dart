import 'package:flutter/material.dart';
import 'package:planningpoker/models/deck.model.dart';
import 'package:planningpoker/widgets/card_content.dart';
import 'package:planningpoker/generated/l10n.dart';

class CardBack extends StatelessWidget {
  const CardBack({
    Key key,
    @required this.data,
    @required this.name,
    @required this.deck,
    @required this.darkTheme,
    @required this.goToRoom,
    @required this.setCard,
  }) : super(key: key);

  final dynamic data;
  final String name;
  final Deck deck;
  final bool darkTheme;
  final void Function() goToRoom;
  final void Function(String, bool) setCard;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              Theme.of(context).brightness == Brightness.light
                  ? 'assets/images/deck_front_light.png'
                  : 'assets/images/deck_front_dark.png',
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
            ),
            CardContent(data: data),
            Align(
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                onPressed: () async {
                  // final connectivityResult = await (Connectivity().checkConnectivity());
                  // if (connectivityResult == ConnectivityResult.none) {
                  //   await Fluttertoast.cancel();
                  //   await Fluttertoast.showToast(
                  //     msg: 'Cannot open room. No internet connection.',
                  //     toastLength: Toast.LENGTH_SHORT,
                  //     gravity: ToastGravity.BOTTOM,
                  //     timeInSecForIosWeb: 1,
                  //     backgroundColor: Colors.red,
                  //     textColor: Colors.white,
                  //     fontSize: 14.0,
                  //   );
                  // } else {
                  //   Navigator.of(context).pop();
                  //   setCard(name, true);
                  //   goToRoom();
                  // }
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45.0)),
                child: Text(
                  L.of(context).openRoom.toUpperCase(),
                  style: TextStyle(
                    color: darkTheme ? Colors.black : Colors.white,
                  ),
                ),
                color: Color(
                  darkTheme ? deck.deckColorDark : deck.deckColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
