import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FaunaticAlert extends StatelessWidget {
  const FaunaticAlert({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      )),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Är du säker att du vill avbryta?'),
          content: const Text(
              'Detta kommer ta bort alla osparade ändrigar och ta dig till hemskärmen.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Nej'),
              child: const Text('Nej'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                context.read<List>().clear();
              },
              child: const Text('Ja'),
            ),
          ],
        ),
      ),
      child: const Text(
        'Avbryt',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
