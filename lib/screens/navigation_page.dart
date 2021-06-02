import 'package:flutter/material.dart';
import 'settings/settings_page.dart';
import 'package:tea_logistics/screens/users_page.dart';
import 'package:tea_logistics/screens/zones_page.dart';
import 'package:tea_logistics/widgets/company_name.dart';
import 'package:tea_logistics/widgets/nav_bar_item.dart';

import 'home_page.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedScreen = 0;
  List<bool> selected = [true, false, false, false];
  List<Widget> _screens = [
    HomePage(),
    ZonesPage(),
    UserPage(),
    SettingsPage(),
  ];

  void select(int n) {
    for (int i = 0; i < 4; i++) {
      if (i != n) {
        selected[i] = false;
      } else {
        selected[i] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tea Collection Management Portal'),
        centerTitle: true,
        actions: [
          Icon(Icons.logout),
        ],
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: 100.0,
                color: Color(0xFF17794F),
                child: Stack(
                  children: [
                    CompanyName(),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 350.0,
                        child: Column(
                          children: [
                            NavBarItem(
                              icon: Icons.home,
                              active: selected[0],
                              touched: () {
                                setState(() {
                                  _selectedScreen = 0;
                                  select(0);
                                });
                              },
                            ),
                            NavBarItem(
                              icon: Icons.assistant,
                              active: selected[1],
                              touched: () {
                                setState(() {
                                  _selectedScreen = 1;
                                  select(1);
                                });
                              },
                            ),
                            NavBarItem(
                              icon: Icons.person,
                              active: selected[2],
                              touched: () {
                                setState(() {
                                  _selectedScreen = 2;
                                  select(2);
                                });
                              },
                            ),
                            NavBarItem(
                              icon: Icons.settings,
                              active: selected[3],
                              touched: () {
                                setState(() {
                                  _selectedScreen = 3;
                                  select(3);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: _screens[_selectedScreen],
            ),
          ],
        ),
      ),
    );
  }
}
