import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tea_logistics/screens/settings/src/general.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 30.0, top: 25.0, bottom: 10.0),
            child: Text(
              'Settings',
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          _tabs(),
          GeneralSettings(),
        ],
      ),
    );
  }

  Widget _tabs() {
    return Container(
      margin: EdgeInsets.only(left: 32.0),
      child: Row(
        children: [
          Text(
            'General',
            style: GoogleFonts.quicksand(
              fontSize: 12.0,
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Container(
            height: 25.0,
            width: 70.0,
            /*decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20.0),
            ),*/
            child: Center(
              child: Text(
                'Billing',
                style: GoogleFonts.quicksand(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            'Locale',
            style: GoogleFonts.quicksand(
              fontSize: 12.0,
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            'Zones',
            style: GoogleFonts.quicksand(
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
