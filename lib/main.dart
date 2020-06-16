import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import './navigators/homeTabNav.dart';
import './navigators/settingsTabNavigator.dart';
import './providers/bottomNavController.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavController())
      ],
      child: MaterialApp(
        title: 'Bottom NavBar Demo',
        home: BottomNavScaffold(),
      ),
    );
  }
}

class BottomNavScaffold extends StatefulWidget {
  BottomNavScaffold({Key key}) : super(key: key);

  @override
  _BottomNavScaffoldState createState() => _BottomNavScaffoldState();
}

class _BottomNavScaffoldState extends State<BottomNavScaffold>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  TabController _tabController;
  List<Widget> _mainTabs;
  List<BuildContext> _navStack = [null, null];

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: _navStack.length);
    _mainTabs = [
      HomeTabNavigator((context) => _navStack[0] = context),
      SettingsTabNavigator((context) => _navStack[1] = context),
    ];
    _setInitalNavcontroller();
    super.initState();
  }

  void _setInitalNavcontroller() {
    Provider.of<BottomNavController>(context, listen: false)
        .setNavConroller(this);
  }

  final List<Map<String, dynamic>> _navItems = [
    {
      'text': 'Home',
      'icon': MaterialCommunityIcons.home_outline,
      'activeIcon': MaterialCommunityIcons.home
    },
    {
      'text': 'Settings',
      'icon': MaterialCommunityIcons.settings_outline,
      'activeIcon': MaterialCommunityIcons.settings
    }
  ];

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    return Provider.of<BottomNavController>(context, listen: false)
        .handleScrollNotification(notification);
  }

  @override
  Widget build(BuildContext context) {
    print('WHOLE APP');
    return WillPopScope(
      child: NotificationListener(
        onNotification: _handleScrollNotification,
        child: Scaffold(
          body: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: _mainTabs,
          ),
          bottomNavigationBar: Consumer<BottomNavController>(
            builder: (context, bottomNav, child) {
              return SizeTransition(
                sizeFactor: bottomNav.getSizeFactor(),
                axisAlignment: -1.0,
                child: Container(
                  decoration: BoxDecoration(
                    border: BorderDirectional(
                      top: BorderSide(
                        width: 1,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  child: BottomNavigationBar(
                    // backgroundColor: Theme.of(context).primaryColor,
                    unselectedFontSize: 12,
                    unselectedIconTheme: IconThemeData(size: 22),
                    selectedFontSize: 14,
                    selectedIconTheme: IconThemeData(size: 26),
                    items: [
                      ..._navItems.map(
                        (item) => BottomNavigationBarItem(
                          activeIcon: Icon(item['activeIcon']),
                          icon: Icon(item['icon']),
                          title: Text(item['text']),
                        ),
                      )
                    ],
                    currentIndex: _currentIndex,
                    onTap: (idx) {
                      _onItemTapped(idx);
                      _tabController.index = idx;
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
      onWillPop: () async {
        print('onWillPop');
        Provider.of<BottomNavController>(context, listen: false).showNav();
        if (Navigator.of(_navStack[_currentIndex]).canPop()) {
          Navigator.of(_navStack[_currentIndex]).pop();
          _onItemTapped(_tabController.index);
          return false;
        } else {
          if (_tabController.index == 0) {
            _onItemTapped(_tabController.index);
            // close the app.  //TODO: Check this
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            return true;
          } else {
            _tabController.index = _currentIndex - 1;
            _onItemTapped(_currentIndex - 1);
            return false;
          }
        }
      },
    );
  }
}
