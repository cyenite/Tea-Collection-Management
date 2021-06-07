import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tea_logistics/config/config.dart';
import 'package:tea_logistics/screens/zone_management_page.dart';
import 'package:tea_logistics/screens/zones_activities.dart';
import 'package:tea_logistics/widgets/company_name.dart';
import 'package:tea_logistics/widgets/nav_bar_item.dart';

import 'home_page.dart';
import 'landing_page.dart';
import 'settings/settings_page.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedScreen = 0;
  List<bool> selected = [true, false, false, false];
  List<Widget> _screens = [
    HomePage(),
    ZoneActivities(),
    ZoneManagement(),
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
        leading: Container(
          margin: EdgeInsets.only(left: 15.0),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(
                colors: [MyColors.blue1, MyColors.blue2],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft),
          ),
          child: Center(
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        title: Text('Tea Collection Management Portal'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  Get.off(LandingPage());
                },
                child: Icon(Icons.logout)),
          ),
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
                color: Color(0xFF15682D),
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
                              icon: Icons.map,
                              active: selected[1],
                              touched: () {
                                setState(() {
                                  _selectedScreen = 1;
                                  select(1);
                                });
                              },
                            ),
                            NavBarItem(
                              icon: Icons.business,
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
