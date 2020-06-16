import 'package:bottom_nav/animations/fadeRoute.dart';
import 'package:bottom_nav/animations/slideRightRoute.dart';
import 'package:flutter/material.dart';

import '../settingsPage.dart';
import '../settingsSubpage.dart';

class SettingsTabNavigator extends StatelessWidget {
  final Function setStack;
  SettingsTabNavigator(this.setStack);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) {
        print(result);
        return false;
      },
      onGenerateRoute: (RouteSettings settings) {
        // print('onGenerateRoute 2 ');
        Function pageBuilder;
        Function transitionsBuilder;
        switch (settings.name) {
          case '/':
            pageBuilder = (context, animation, secondaryAnimation) {
              setStack(context);
              return SettingsPage();
            };
            transitionsBuilder =
                (context, animation, secondaryAnimation, child) {
              return FadeRoute(context, animation, secondaryAnimation, child);
            };
            break;
          case '/subsetting':
            pageBuilder =
                (context, animation, secondaryAnimation) => SettingsSubPage();
            transitionsBuilder =
                (context, animation, secondaryAnimation, child) {
              return SlideRightRoute(
                  context, animation, secondaryAnimation, child);
            };
            break;
          default:
        }
        return PageRouteBuilder(
          pageBuilder: pageBuilder,
          transitionsBuilder: transitionsBuilder,
        );
      },
    );
  }
}
