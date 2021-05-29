import 'package:flutter/material.dart';

class FaunaticListTile extends StatelessWidget {
  final Function onTap;
  final Color color;
  final String text;
  final Widget child;
  final Icon icon;

  const FaunaticListTile(
      {Key key,
      @required this.onTap,
      @required this.color,
      this.text,
      this.icon = const Icon(
        Icons.arrow_forward_ios,
        size: 18,
      ),
      this.child})
      : super(key: key);

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
          child: child ??
              Text(
                text,
                style: TextStyle(fontSize: 18),
              ),
        ),
        trailing: Transform.translate(offset: Offset(-10, 0), child: icon),
        onTap: onTap,
      ),
    );
  }
}
