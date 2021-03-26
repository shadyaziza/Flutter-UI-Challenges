import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flag/flag.dart';

class TransformedDrawer extends StatefulWidget {
  const TransformedDrawer({Key key}) : super(key: key);

  @override
  _TransformedDrawerState createState() => _TransformedDrawerState();
}

class _TransformedDrawerState extends State<TransformedDrawer>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
  }

  void toggleAnimation() => _animationController.isDismissed
      ? _animationController.forward()
      : _animationController.reverse();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double maxSlide = size.width / 4;
    return Scaffold(
        body: AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) {
        double slide = maxSlide * _animationController.value;
        double scale = 1 - (_animationController.value * 0.3);
        return Stack(
          children: [
            DrawerContainer(),
            Transform(
              alignment: Alignment.centerRight,
              transform: Matrix4.identity()
                ..translate(slide)
                ..scale(scale),
              child: HomeContainer(
                onPressed: toggleAnimation,
              ),
            ),
          ],
        );
      },
    ));
  }
}

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key key, @required this.onPressed}) : super(key: key);
  final String _bg = "assets/background/bg.svg";
  final String _menu = "assets/icon/menu.svg";
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xffFBAE3C),
          spreadRadius: 0,
          blurRadius: 12,
          offset: Offset(0, 4), // changes position of shadow
        ),
      ]),
      child: Stack(
        children: [
          Container(
            child: SvgPicture.asset(
              _bg,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Transformed Drawer',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xffFBAE3C),
              ),
            ),
          ),
          Positioned(
            left: 25,
            top: 75,
            child: InkWell(
              onTap: onPressed,
              child: SvgPicture.asset(_menu),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerContainer extends StatelessWidget {
  const DrawerContainer({Key key}) : super(key: key);
  final String _avatar = 'https://i.pravatar.cc/100';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 55.0),
      color: Color(0xff001220),
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              radius: 50,
              child: ClipOval(
                child: Image.network(_avatar),
              ),
            ),
          ),
          Divider(
            height: 28.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Home",
                  style: TextStyle(color: Color(0xffFBAE3C), fontSize: 20),
                ),
                SizedBox(
                  height: 28.0,
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                      color: Color(0xffFBAE3C).withOpacity(0.7), fontSize: 20),
                ),
                SizedBox(
                  height: 28.0,
                ),
                Text(
                  "Settings",
                  style: TextStyle(
                      color: Color(0xffFBAE3C).withOpacity(0.7), fontSize: 20),
                ),
                SizedBox(
                  height: 28.0,
                ),
                Text(
                  "Help",
                  style: TextStyle(
                      color: Color(0xffFBAE3C).withOpacity(0.7), fontSize: 20),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                ),
                Container(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 1.7),
                  child: Flag(
                    'ES',
                    fit: BoxFit.contain,
                    height: 20,
                    // fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 28.0,
                ),
                Text(
                  "Sign Out",
                  style: TextStyle(
                      color: Color(0xffFBAE3C).withOpacity(0.7), fontSize: 20),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
