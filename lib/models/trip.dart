import 'package:flutter/material.dart';

class Trip {
  final String zone;
  final Color color;
  final String status;
  final String date;
  final String ratings;

  Trip({
    @required this.color,
    @required this.date,
    @required this.ratings,
    @required this.status,
    @required this.zone,
  });
}
