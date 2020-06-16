import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bottomNavController.dart';
import '../animations/fadeRoute.dart';
import '../animations/slideRightRoute.dart';
import '../homeSubSubPage.dart';
import '../homePage.dart';
import '../homeSubpage.dart';

class HomeTabNavigator extends StatelessWidget {
  final Function setStack;
  HomeTabNavigator(this.setStack);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) {
        print(result);
        return false;
      },
      onGenerateRoute: (RouteSettings settings) {
        // print('onGenerateRoute 1 ');
        Function pageBuilder;
        Function transitionsBuilder;
        switch (settings.name) {
          case '/':
            pageBuilder = (context, animation, secondaryAnimation) {
              setStack(context);
              return HomePage();
            };
            transitionsBuilder =
                (context, animation, secondaryAnimation, child) {
              return FadeRoute(context, animation, secondaryAnimation, child);
            };
            break;
          case '/subhome':
            pageBuilder =
                (context, animation, secondaryAnimation) => HomeSubPage();
            transitionsBuilder =
                (context, animation, secondaryAnimation, child) {
              return FadeRoute(context, animation, secondaryAnimation, child);
            };
            break;
          case '/subsubhome':
            pageBuilder =
                (context, animation, secondaryAnimation) => HomeSubSubPage();
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
