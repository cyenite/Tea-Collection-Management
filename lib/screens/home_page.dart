import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tea_logistics/config/config.dart';
import 'package:tea_logistics/widgets/subheader.dart';
import 'package:tea_logistics/widgets/trip_card.dart';
import 'package:tea_logistics/widgets/zone_card.dart';
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
            //Tabs(),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ZoneCard(
                      timeAgo: '12/04/2021',
                      zoneName: 'Kapchebet',
                      trips: 54,
                      color: Colors.red,
                      percentComplete: 100,
                      progressIndicatorColor: primaryColor,
                    ),
                    ZoneCard(
                      timeAgo: '12/04/2021',
                      zoneName: 'Nakuru',
                      trips: 0,
                      color: Colors.green,
                      percentComplete: 100,
                      progressIndicatorColor: primaryColor,
                    ),
                    ZoneCard(
                      timeAgo: '12/04/2021',
                      zoneName: 'Jamjii',
                      trips: 11,
                      color: Colors.blue,
                      percentComplete: 100,
                      progressIndicatorColor: primaryColor,
                    ),
                    ZoneCard(
                      timeAgo: '12/04/2021',
                      zoneName: 'Kabianga',
                      trips: 46,
                      color: Colors.blueGrey,
                      percentComplete: 100,
                      progressIndicatorColor: primaryColor,
                    ),
                    ZoneCard(
                      timeAgo: '12/04/2021',
                      zoneName: 'Kibingei',
                      trips: 23,
                      color: Colors.yellow,
                      percentComplete: 100,
                      progressIndicatorColor: primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            SubHeader(
              title: 'Zones',
            ),
            Column(
              children: [
                Trips(
                  color: Color(0xffFF4C60),
                  zone: 'Cheptigit',
                  date: '12/02/2021',
                  ratings: '3.5',
                  status: 'Incomplete',
                ),
                Trips(
                  color: Color(0xff6C6CE5),
                  zone: 'Kabianga',
                  date: '12/02/2021',
                  ratings: '4.5',
                  status: 'Ongoing',
                ),
                Trips(
                  color: Color(0xffFAAA1E),
                  zone: 'Jamjii',
                  date: '12/02/2021',
                  ratings: '5.0',
                  status: 'Complete',
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
