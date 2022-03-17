import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  void removeAndNavigatorToRoute(String _route) {
    navigatorKey.currentState?.popAndPushNamed(_route);
  }

  void navigatorToRoute(String _route) {
    navigatorKey.currentState?.pushNamed(_route);
  }

  void navigateToPage(Widget _page) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (BuildContext _context) {
          return _page;
        },
      ),
    );
  }

  void goBack() {
    navigatorKey.currentState?.pop();
  }
}
