import 'package:flutter/material.dart';
import 'package:appbar_animated/appbar_animated.dart';

class Custombar extends StatelessWidget {
  final Widget child;
  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final Widget bottomNavigationBar;

  const Custombar({
    Key? key,
    required this.child,
    required this.floatingActionButton,
    required this.floatingActionButtonLocation,
    required this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaffoldLayoutBuilder(
        backgroundColorAppBar:
            const ColorBuilder(Colors.transparent, Color(0xFF199A8E)),
        textColorAppBar: const ColorBuilder(Colors.white),
        appBarBuilder: (context, colorAnimated) =>
            _appBar(context, colorAnimated),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                "assets/images/background.png",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .4,
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.36,
                ),
                height: 1000,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: child,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  Widget _appBar(BuildContext context, ColorAnimated colorAnimated) {
    return AppBar(
      backgroundColor: colorAnimated.background,
      elevation: 0,
      title: Text(
        "AppBar Animate",
        style: TextStyle(
          color: colorAnimated.color,
        ),
      ),
      leading: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: colorAnimated.color,
      ),
    );
  }
}
