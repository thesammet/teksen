import 'package:flutter/material.dart';
import 'package:teksen_mobile/app/view/tab_views/home_page.dart';
import 'package:teksen_mobile/app/view/tab_views/union_view.dart';

class TabNavigatorRoutes {}

class TabNavigator extends StatefulWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  @override
  Widget build(BuildContext context) {
    Widget child;
    if (widget.tabItem == "Home")
      child = HomeView();
    else if (widget.tabItem == "Union") child = UnionView();
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
