import 'package:flutter/material.dart';

class FaunaticListTile extends StatelessWidget {
  final Function onTap;
  final Color color;
  final String text;
  const FaunaticListTile({
    Key key, @required this.onTap, @required this.color, @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: Transform.translate(
          offset: Offset(-10, 0),
          child: Container(
            height: 70,
            width: 6,
            color: color,
          ),
        ),
        title: Transform.translate(
          offset: Offset(-45, 0),
          child: Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
        ),
        trailing: Transform.translate(
          offset: Offset(-10, 0),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 18,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}