import 'package:flutter/material.dart';

class Zone {
  final Color color;
  final String timeAgo;
  final Color progressIndicatorColor;
  final String zoneName;
  final int percentComplete;
  final IconData icon;
  final int trips;
  Zone({
    @required this.timeAgo,
    @required this.color,
    @required this.progressIndicatorColor,
    @required this.percentComplete,
    @required this.zoneName,
    @required this.icon,
    @required this.trips,
  });
}
