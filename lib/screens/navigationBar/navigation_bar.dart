import 'package:flutter/material.dart';
import 'package:tea_logistics/widgets/company_name.dart';
import 'package:tea_logistics/widgets/nav_bar_item.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  List<bool> selected = [true, false, false, false, false];
  List<Widget> _screens = [];

  void select(int n) {
    for (int i = 0; i < 5; i++) {
      if (i != n) {
        selected[i] = false;
      } else {
        selected[i] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
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
                          select(0);
                        });
                      },
                    ),
                    NavBarItem(
                      icon: Icons.assistant,
                      active: selected[1],
                      touched: () {
                        setState(() {
                          select(1);
                        });
                      },
                    ),
                    NavBarItem(
                      icon: Icons.person,
                      active: selected[2],
                      touched: () {
                        setState(() {
                          select(2);
                        });
                      },
                    ),
                    NavBarItem(
                      icon: Icons.settings,
                      active: selected[4],
                      touched: () {
                        setState(() {
                          select(4);
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
    );
  }
}
