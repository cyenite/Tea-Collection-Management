import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tea_logistics/config/config.dart';
import 'package:tea_logistics/screens/navigation_page.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: buildHeader(),
    );
  }

  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[buildLogo(), buildHeaderLinks()],
    );
  }

  //Builds navigation links at the right top of landing page
  Widget buildHeaderLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: getLinksListing()..add(buildLoginButton()),
    );
  }

  //Builds navigation list for header
  List<Widget> getLinksListing() {
    var links = ["Home", "Reports"];
    return links.map((link) {
      return Padding(
        padding: EdgeInsets.only(left: 18),
        child: Text(
          link,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      );
    }).toList();
  }

  //Builds and decorates login button
  Widget buildLoginButton() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(left: 20),
          width: 120,
          height: 40,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [MyColors.blue1, MyColors.blue2],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: MyColors.blue3.withOpacity(0.3),
                    offset: Offset(0, 8), //Shadow starts at x=0, y=8
                    blurRadius: 8)
              ]),
          child: GestureDetector(
            onTap: () {
              Get.off(NavigationPage());
            },
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: Text(
                  Strings.loginButton,
                  style: TextStyle(
                      color: MyColors.white1, fontSize: 18, letterSpacing: 1),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Builds rectangle with circular corners and Text on it and next to it as title
  Widget buildLogo() {
    return Row(
      children: <Widget>[
        Container(
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
        //give some space between logo box and title
        SizedBox(
          width: 16,
        ),
        Text(
          Strings.appTitle,
          style: TextStyle(fontSize: 26),
        )
      ],
    );
  }
}
