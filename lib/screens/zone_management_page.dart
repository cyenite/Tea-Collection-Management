import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tea_logistics/widgets/zone_listing_container.dart';

class ZoneManagement extends StatefulWidget {
  @override
  _ZoneManagementState createState() => _ZoneManagementState();
}

class _ZoneManagementState extends State<ZoneManagement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 30.0, top: 25.0, bottom: 10.0),
            child: Text(
              'Zone Management',
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              top: 5.0,
              bottom: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Zones',
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
                GestureDetector(
                  onTap: () async {},
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 13.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                    ),
                    child: Text(
                      'Add Zone',
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              ZoneListingContainer(
                date: '12.12.2020',
                vehicles: '21',
                zone: 'Kabianga Zone',
              )
            ],
          ),
        ],
      ),
    );
  }
}
