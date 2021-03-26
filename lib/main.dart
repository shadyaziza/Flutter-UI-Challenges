import 'package:flutter/material.dart';

void main() {
  runApp(UIChallenge());
}

class UIChallenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TransformedDrawer());
  }
}
