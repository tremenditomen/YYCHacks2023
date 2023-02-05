import 'dart:async';
import 'dart:convert';
import "package:dio/dio.dart";
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

  List<dynamic> events = [];

  Set<Marker> markers = {};

  @override
  void initState() {
    getEventData();
    super.initState();
  }

  @override
  void dispose() {
    Dio().close(force: true);
    super.dispose();
  }

  void getEventData() async {
    var response = await Dio().get("http://20.246.2.152/api1/events");
    setState(() {
      events = response.data;
    });
    Iterable eventsToBeMarked = events.getRange(0, 20);
    eventsToBeMarked.forEach((element) {
      markers.add(
        Marker(
          markerId: MarkerId(element["name"]),
          position: LatLng(element["latitude"], element["longitude"]),
        ),
      );
    });
    setState(() {
      markers = markers.toSet();
    });
  }

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
          markers: markers,
        ),
        SlidingUpPanel(
          color: Colors.red[800]!,
          panel: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: events.isEmpty
                ? const Center(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  )
                : ListView(
                    children: events.map<Widget>(
                      (e) {
                        return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Card(
                              clipBehavior: Clip.hardEdge,
                              child: SizedBox(
                                height: 125,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      child: Image(
                                        fit: BoxFit.fitWidth,
                                        image: e["img_url"] != null
                                            ? NetworkImage(e["img_url"])
                                            : const NetworkImage(
                                                "https://via.placeholder.com/150"),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            e["name"],
                                            overflow: TextOverflow.fade,
                                            style:
                                                const TextStyle(fontSize: 20),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Text(
                                          e["address"],
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          e["phone_number"],
                                          textAlign: TextAlign.left,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ));
                      },
                    ).toList(),
                    // Padding(
                    //   padding: EdgeInsets.all(10.0),
                    //   child: Card(
                    //     surfaceTintColor: Colors.white,
                    //     child: SizedBox(
                    //       height: 125,
                    //     ),
                    //   ),
                    // )
                  ),
          ),
        )
      ],
    ));
  }
}
