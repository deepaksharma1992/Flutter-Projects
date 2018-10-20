import 'package:code_challange/ui/static_screen.dart';
import 'package:code_challange/ui/ui_util.dart';
import 'package:flutter/material.dart';

//  created by deepaks
//  stateful widget class to show the change fly animation
class AnimatedScreen extends StatefulWidget {
  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen>
    with TickerProviderStateMixin {
  // animation controller to control animation object
  AnimationController _controller;

  // animation object to define the animation used for widget
  Animation _animation, _lateAnimation;

  // init state method to initialize the controller and animation objects
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
    //starting the animation
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          // Scaffold widget to use default app bar
          return Scaffold(
            // App bar widget with white theme
            appBar: UiUtil.getAppBar("Animated Screen"),
            body: Transform(
              transform:
                  Matrix4.translationValues(_animation.value * width, 0.0, 0.0),
              //Container widget to contain the images and aligning them to center of screen
              child: UiUtil.getChangeFlyImage(),
            ),
            // floating action button to start new screen
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                debugPrint("pressed");
                Navigator.push(
                  context,
                  // using material route to start the new static screen
                  MaterialPageRoute(builder: (context) => StaticScreen()),
                );
              },
              child: new Icon(Icons.navigate_next),
            ),
          );
        });
  }

  // disposing hte controller object to avoid any memory leak
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
