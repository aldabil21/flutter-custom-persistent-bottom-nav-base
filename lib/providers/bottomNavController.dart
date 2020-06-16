import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BottomNavController extends ChangeNotifier {
  AnimationController _hide;
  bool _isShowable = true;

  void setNavConroller(vsync) {
    _hide = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 500),
    );
    _hide.forward();
    // print('setNavConroller');
  }

  void showNav() {
    print(_hide.value);
    _hide.forward();
    notifyListeners();
  }

  void hideNav() {
    print(_hide.status);
    _hide.reverse();
    notifyListeners();
  }

  void setShowable(bool showable) {
    if (_isShowable != showable) {
      _isShowable = showable;
      if (!showable) {
        hideNav();
      } else {
        showNav();
      }
    }
  }

  AnimationController getSizeFactor() {
    // print('getSizeFactor');
    return _hide;
  }

  bool handleScrollNotification(ScrollNotification notification) {
    if (_isShowable && notification.depth > 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            showNav();
            break;
          case ScrollDirection.reverse:
            hideNav();
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }

  @override //TODO: Could be omitted?
  void dispose() {
    _hide.dispose();
    super.dispose();
  }
}
