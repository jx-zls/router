import 'package:flutter/material.dart';

class G{
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static NavigatorState getCurrentState() => navigatorKey.currentState;
  static BuildContext getCurrentContext() => navigatorKey.currentContext;
  static EdgeInsets screenPadding() => MediaQuery.of(getCurrentContext()).padding;
  static double screenWidth() => MediaQuery.of(getCurrentContext()).size.width;
  static double screenHeight() => MediaQuery.of(getCurrentContext()).size.height;

}