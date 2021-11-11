import 'package:flutter/material.dart';

class FinishedWidget extends StatelessWidget {
  const FinishedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Some finished widget'),
      ),
    );
  }
}
