import 'package:flutter/material.dart';

class MyRoute extends MaterialPageRoute {
  MyRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    Animation<Offset> custom =
    Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
        .animate(animation);
    return SlideTransition(
      position: custom,
      child: child,
    );
  }
}
class MyRoute1 extends MaterialPageRoute {
  MyRoute1({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    Animation<Offset> custom =
    Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
        .animate(animation);
    return SlideTransition(
      position: custom,
      child: child,
    );
  }
}
class MyrouteDuration extends PageRouteBuilder {
  Widget widget;

  MyrouteDuration({this.widget})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return widget;
  }, transitionsBuilder: (BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    Animation<Offset> custom =
    Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
        .animate(animation);
    return SlideTransition(
      position: custom,
      child: child,
    );
  });
}
