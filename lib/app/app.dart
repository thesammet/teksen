import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:teksen_mobile/app/tab_navigator.dart';

class TeksenApp extends StatefulWidget {
  @override
  _TeksenAppState createState() => _TeksenAppState();
}

class _TeksenAppState extends State<TeksenApp> {
  String _currentPage = "Home";
  List<String> pageKeys = [
    "Home",
    "Union",
  ];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Home": GlobalKey<NavigatorState>(),
    "Union": GlobalKey<NavigatorState>(),
  };
  int _selectedIndex = 0;

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "Page1") {
            _selectTab("Page1", 1);

            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator("Home"),
          _buildOffstageNavigator("Union"),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          //enableFeedback: ,
          unselectedIconTheme: IconThemeData(color: const Color(0xff909090)),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: 10,
            color: const Color(0xff909090),
          ),
          selectedItemColor: const Color(0xff1799cc),
          selectedIconTheme: IconThemeData(color: const Color(0xff1799cc)),
          selectedLabelStyle: TextStyle(
            fontFamily: 'OpenSans-Regular',
            fontSize: 10,
            color: const Color(0xff1799cc),
          ),

          onTap: (int index) {
            _selectTab(pageKeys[index], index);
          },
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: Icon(Icons.home)),
                label: "Anasayfa"),
            BottomNavigationBarItem(
                icon: Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: Icon(Icons.info_outline)),
                label: "Sendika"),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
