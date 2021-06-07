import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:marquee/marquee.dart';
import 'package:tea_logistics/config/config.dart';

const randomMarkerNum = 100;

class ZoneActivities extends StatefulWidget {
  @override
  _ZoneActivitiesState createState() => _ZoneActivitiesState();
}

class _ZoneActivitiesState extends State<ZoneActivities> {
  final Random _rnd = new Random();
  double _latitude = -0.36447231406911507;
  double _longitude = 35.272096629677485;

  MapboxMapController _mapController;
  List<Marker> _markers = [];
  List<_MarkerState> _markerStates = [];

  void _addMarkerStates(_MarkerState markerState) {
    _markerStates.add(markerState);
  }

  void _onMapCreated(MapboxMapController controller) {
    _mapController = controller;
    controller.addListener(() {
      if (controller.isCameraMoving) {
        _updateMarkerPosition();
      }
    });
  }

  void _onStyleLoadedCallback() {
    print('onStyleLoadedCallback');
  }

  void _onMapLongClickCallback(Point<double> point, LatLng coordinates) {
    _addMarker(point, coordinates);
  }

  void _onCameraIdleCallback() {
    _updateMarkerPosition();
  }

  void _updateMarkerPosition() {
    final coordinates = <LatLng>[];

    for (final markerState in _markerStates) {
      coordinates.add(markerState.getCoordinate());
    }

    _mapController.toScreenLocationBatch(coordinates).then((points) {
      _markerStates.asMap().forEach((i, value) {
        _markerStates[i].updatePosition(points[i]);
      });
    });
  }

  void _addMarker(Point<double> point, LatLng coordinates) {
    setState(() {
      _markers.add(Marker(_rnd.nextInt(100000).toString(), coordinates, point,
          _addMarkerStates));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /*Positioned.fill(
          child: MapboxMap(
            accessToken:
                'pk.eyJ1IjoiYWFya2lwIiwiYSI6ImNrbzh0b2l0eDBiajAycnFtZ2xwdTdhZGwifQ.BL8ZtdHeXXRAMlas2zPxSQ',
            initialCameraPosition: const CameraPosition(
              target: LatLng(-0.36447231406911507, 35.272096629677485),
              zoom: 9,
            ),
          ),
        ),*/
        MapboxMap(
          accessToken:
              'pk.eyJ1IjoiYWFya2lwIiwiYSI6ImNrbzh0b2l0eDBiajAycnFtZ2xwdTdhZGwifQ.BL8ZtdHeXXRAMlas2zPxSQ',
          trackCameraPosition: true,
          onMapCreated: _onMapCreated,
          onMapLongClick: _onMapLongClickCallback,
          onCameraIdle: _onCameraIdleCallback,
          onStyleLoadedCallback: _onStyleLoadedCallback,
          initialCameraPosition: const CameraPosition(
              target: LatLng(-0.36447231406911507, 35.272096629677485),
              zoom: 9),
        ),
        IgnorePointer(
            ignoring: true,
            child: Stack(
              children: _markers,
            )),
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
                    //_measurePerformance();

                    // Generate random markers
                    var param = <LatLng>[];
                    for (var i = 0; i < randomMarkerNum; i++) {
                      final lat = _rnd.nextDouble() * 20 + 30;
                      final lng = _rnd.nextDouble() * 20 + 125;
                      param.add(LatLng(_latitude, _longitude));
                    }

                    _mapController.toScreenLocationBatch(param).then((value) {
                      for (var i = 0; i < randomMarkerNum; i++) {
                        var point = Point<double>(
                            value[i].x as double, value[i].y as double);
                        _addMarker(point, param[i]);
                      }
                    });
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

class Marker extends StatefulWidget {
  final Point _initialPosition;
  final LatLng _coordinate;
  final void Function(_MarkerState) _addMarkerState;

  Marker(
      String key, this._coordinate, this._initialPosition, this._addMarkerState)
      : super(key: Key(key));

  @override
  State<StatefulWidget> createState() {
    final state = _MarkerState(_initialPosition);
    _addMarkerState(state);
    return state;
  }
}

class _MarkerState extends State with TickerProviderStateMixin {
  final _iconSize = 20.0;

  Point _position;

  AnimationController _controller;
  Animation<double> _animation;

  _MarkerState(this._position);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var ratio = 1.0;
    return Positioned(
        left: _position.x / ratio - _iconSize / 2,
        top: _position.y / ratio - _iconSize / 2,
        child: RotationTransition(
            turns: _animation,
            child:
                Image.asset('assets/images/car.png', height: _iconSize * 2)));
  }

  void updatePosition(Point<num> point) {
    setState(() {
      _position = point;
    });
  }

  LatLng getCoordinate() {
    return (widget as Marker)._coordinate;
  }
}
