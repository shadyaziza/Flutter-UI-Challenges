import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransformedDrawer extends StatelessWidget {
  const TransformedDrawer({Key key}) : super(key: key);
  final String _menu = "assets/icon/menu.svg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomeContainer(),
          Positioned(
            left: 25,
            top: 75,
            child: InkWell(
              onTap: () {
                print('awesoe');
              },
              child: SvgPicture.asset(_menu),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key key}) : super(key: key);
  final String _bg = "assets/background/bg.svg";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        _bg,
        fit: BoxFit.cover,
      ),
    );
  }
}
