import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tea_logistics/config/config.dart';
import 'package:tea_logistics/models/zones.dart';
import 'package:tea_logistics/services/database_helper.dart';
import 'package:tea_logistics/widgets/zone_card.dart';

class ZoneManagement extends StatefulWidget {
  @override
  _ZoneManagementState createState() => _ZoneManagementState();
}

class _ZoneManagementState extends State<ZoneManagement> {
  final GlobalKey<FormState> _reqFormKey = GlobalKey<FormState>();
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _latitudeEditingController =
      TextEditingController();
  final TextEditingController _longitudeEditingController =
      TextEditingController();

  Future<void> addZoneDialog() async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _reqFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _nameEditingController,
                        validator: (value) {
                          return value.isNotEmpty ? null : "Zone name required";
                        },
                        decoration: InputDecoration(
                          hintText: "Name of zone",
                        ),
                      ),
                      TextFormField(
                        controller: _latitudeEditingController,
                        validator: (value) {
                          return value.isNotEmpty ? null : "Latitude required";
                        },
                        decoration: InputDecoration(
                          hintText: "Enter latitude",
                        ),
                      ),
                      TextFormField(
                        controller: _longitudeEditingController,
                        validator: (value) {
                          return value.isNotEmpty ? null : "Longitude required";
                        },
                        minLines: 2,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Enter longitude",
                        ),
                      ),
                    ],
                  )),
              title: Text('Add New Station'),
              actions: <Widget>[
                InkWell(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: primaryColor,
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
                      'Add',
                    ),
                  ),
                  onTap: () async {
                    if (_reqFormKey.currentState.validate()) {
                      await DbHelper.addZone(
                        Zone(
                          zoneName: _nameEditingController.text,
                          timeAgo: DateTime.now().toString(),
                          latitude:
                              double.parse(_latitudeEditingController.text),
                          trips: 0,
                          longitude:
                              double.parse(_longitudeEditingController.text),
                        ),
                      );
                    }
                  },
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
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
          StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("zones").snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                print('snapshot: ${snapshot.data}');
                if (snapshot.hasData && snapshot.data != null) {
                  final docs = snapshot.data.docs;
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: docs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: defaultPadding,
                      mainAxisSpacing: defaultPadding,
                      childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
                    ),
                    itemBuilder: (context, index) {
                      final station = docs[index].data();
                      return ZoneCard(
                        timeAgo: station['createdAt'],
                        zoneName: station['name'],
                        trips: station['trips'],
                        color: Colors.red,
                        percentComplete: 100,
                        progressIndicatorColor: primaryColor,
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ],
      ),
    );
  }
}
