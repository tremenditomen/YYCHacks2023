import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _initalCalgary = CameraPosition(
      target: LatLng(51.02323469598919, -114.06727911115647), zoom: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: _initalCalgary,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        SlidingUpPanel(
          color: Colors.red[800]!,
          panel: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: ListView(children: const [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Card(
                  surfaceTintColor: Colors.white,
                  child: SizedBox(
                    height: 125,
                  ),
                ),
              )
            ]),
          ),
        )
      ],
    ));
  }
}
