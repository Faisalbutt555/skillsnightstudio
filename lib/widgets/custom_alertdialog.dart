import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context, String txt, String content) {
  showDialog(
      builder: (context) => CupertinoAlertDialog(
            title: Text(
              txt,
              style: const TextStyle(
                fontSize: 21,
              ),
            ),
            content: Text(content,
                style: const TextStyle(
                  color: Colors.grey,
                )),
            actions: <Widget>[
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Ok",
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
      context: context);
}
