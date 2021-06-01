import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tea_logistics/widgets/subheader.dart';
import 'package:tea_logistics/widgets/tabs.dart';
import 'package:tea_logistics/widgets/zone_item_details.dart';
import 'package:tea_logistics/widgets/zone_statistics_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.63,
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 30.0, top: 25.0, bottom: 10.0),
              child: Text(
                'Active Zones',
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            Tabs(),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              height: 200.0,
              width: MediaQuery.of(context).size.width * 0.62,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [],
              ),
            ),
            SubHeader(
              title: 'Zones',
            ),
            Column(
              children: [
                ZoneItem(
                  color: Color(0xffFF4C60),
                  vehicles: '21',
                  date: '12/02/2021',
                  transits: '456',
                  title: 'Kabianga Zone',
                ),
                ZoneItem(
                  color: Color(0xff6C6CE5),
                  vehicles: '21',
                  date: '12/02/2021',
                  transits: '45',
                  title: 'Kericho West',
                ),
                ZoneItem(
                  color: Color(0xffFAAA1E),
                  vehicles: '21',
                  date: '12/02/2021',
                  transits: '34',
                  title: 'Jamjii',
                ),
              ],
            ),
            SubHeader(
              title: 'Zone Statistics',
            ),
            ZoneStatisticsCards(),
          ],
        ),
      ),
    );
  }
}
