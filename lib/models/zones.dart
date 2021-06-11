import 'package:flutter/material.dart';

class Zone {
  final Color color;
  final String timeAgo;
  final Color progressIndicatorColor;
  final String zoneName;
  final int percentComplete;
  final IconData icon;
  final int trips;
  final double latitude;
  final double longitude;

  Zone({
    @required this.timeAgo,
    this.color,
    this.progressIndicatorColor,
    this.percentComplete,
    @required this.zoneName,
    this.icon,
    @required this.longitude,
    @required this.latitude,
    @required this.trips,
  });
}
