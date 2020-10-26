import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  const CardContent({
    Key key,
    @required this.data,
  }) : super(key: key);

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    // check nature
    if (data is String) {
      return Center(
        child: Text(
          data,
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline1.fontSize,
              fontWeight: FontWeight.bold),
        ),
      );
    } else if (data is Color) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
            margin: EdgeInsets.only(bottom: 6),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
              color: data,
            ),
            child: null,
          ),
        ),
      );
    } else if (data is IconData) {
      return Center(
        child: Icon(data, size: 128),
      );
    } else {
      throw ('Unsupported element type for grid.');
    }
  }
}
