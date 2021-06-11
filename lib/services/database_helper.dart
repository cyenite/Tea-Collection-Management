import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geo_firestore_flutter/geo_firestore_flutter.dart';
import 'package:tea_logistics/models/zones.dart';

class DbHelper {
  static FirebaseFirestore _db = FirebaseFirestore.instance;

  static addZone(Zone zone) async {
    GeoFirestore geoFirestore = GeoFirestore(_db.collection('zones'));
    final stationRef = _db.collection("zones").doc(zone.zoneName);

    Map<String, dynamic> stationData = {
      "name": zone.zoneName,
      "createdAt": zone.timeAgo,
      "trips": zone.trips,
    };

    await stationRef.set(stationData);
    await geoFirestore.setLocation(
        stationRef.id, GeoPoint(zone.latitude, zone.longitude));
  }
}
