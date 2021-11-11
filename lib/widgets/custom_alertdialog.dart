import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertBox extends StatelessWidget {
  final String? title;
  final String? cont;
  const CustomAlertBox(String s, String b, {Key? key, this.cont, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title!,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      content: Text(
        cont!,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      actions: const <Widget>[
        CupertinoDialogAction(child: Text('ok')),
      ],
    );
  }
}
