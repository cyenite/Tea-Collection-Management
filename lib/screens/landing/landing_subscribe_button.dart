import 'package:flutter/material.dart';
import 'package:tea_logistics/config/config.dart';

class SubscribeButton extends StatelessWidget {
  var emailImage = "assets/images/email.png";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [MyColors.blue1, MyColors.blue2],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                  color: MyColors.blue3.withOpacity(.3),
                  offset: Offset(0, 8),
                  blurRadius: 8.0)
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {}, //TODO
            child: Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      Strings.subscribeButton,
                      style: TextStyle(
                          color: MyColors.white1,
                          fontSize: 16,
                          letterSpacing: 1),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Image.asset(
                      emailImage,
                      color: MyColors.white1,
                      width: 20,
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
