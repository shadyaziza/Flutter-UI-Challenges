import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge/transformed_drawer.dart';

void main() {
  runApp(UIChallenge());
}

class UIChallenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TransformedDrawer());
  }
}
