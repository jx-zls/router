import 'package:flutter/material.dart';

class G{
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static NavigatorState getCurrentState() => navigatorKey.currentState;
  static BuildContext getCurrentContext() => navigatorKey.currentContext;

}