import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:marquee/marquee.dart';
import 'package:tea_logistics/config/config.dart';
import 'package:tea_logistics/widgets/marker.dart';

class ZonesPage extends StatefulWidget {
  @override
  _ZonesPageState createState() => _ZonesPageState();
}

class _ZonesPageState extends State<ZonesPage> {
  MapboxMapController _mapController;
  List<Marker> _markers = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: MapboxMap(
            accessToken:
                'pk.eyJ1IjoiYWFya2lwIiwiYSI6ImNrbzh0b2l0eDBiajAycnFtZ2xwdTdhZGwifQ.BL8ZtdHeXXRAMlas2zPxSQ',
            initialCameraPosition: const CameraPosition(
              target: LatLng(-0.36447231406911507, 35.272096629677485),
              zoom: 9,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 20.0,
            child: Marquee(
              text:
                  'This page will show all activities happening in all of the zones registered in the system, including location of trucks, and ongoing trips.                 ',
              style: TextStyle(
                color: Colors.red,
                backgroundColor: Colors.white24,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: EdgeInsets.only(top: 50.0),
            width: MediaQuery.of(context).size.width * 0.5,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                fillColor: secondaryColor,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    print('Search icon tapped');
                  },
                  child: Container(
                    padding: EdgeInsets.all(defaultPadding * 0.75),
                    margin:
                        EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: SvgPicture.asset("assets/icons/Search.svg"),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
