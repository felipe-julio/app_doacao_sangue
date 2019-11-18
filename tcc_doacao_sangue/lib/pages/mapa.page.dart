import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  bool isLoading;
  String errorMessage;
  Map<String, double> userLocation;
  List<Placemark> _places = [];
  List<Marker> allMarkers = [];
  Iterable markers = [];
  final places =
      new GoogleMapsPlaces(apiKey: "AIzaSyBKnfHnPez4ZMWlUTMg-EjwucTfiAJ3PmA");

  static CameraPosition _myLocation;
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa com Hemocentros Próximos"),
      ),
      // 1
      body: GoogleMap(
        // 2
        initialCameraPosition:
            CameraPosition(target: LatLng(-21.7946, -48.1766), zoom: 15),
        // 3
        mapType: MapType.normal,
        // 4
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set.from(markers),
        myLocationEnabled: true,
      ),
    );
  }

  void getLocation() async {
    // userLocation = await location.getLocation();

    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    final response = await Client().get(
        "https://maps.googleapis.com/maps/api/place/textsearch/json?query=Hemocentro&key=AIzaSyBKnfHnPez4ZMWlUTMg-EjwucTfiAJ3PmA");

    Map responseBody = json.decode(response.body);
    List results = responseBody["results"];

    Iterable _markers = Iterable.generate(4, (index) {
      Map result = results[index];
      Map location = result["geometry"]["location"];
      LatLng latLngMarker = LatLng(location["lat"], location["lng"]);

      return Marker(
          markerId: MarkerId("marker$index"),
          position: latLngMarker,
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                        result["name"] + " " + result["formatted_address"]),
                  );
                });
          });
    });

    setState(() {
      markers = _markers;
    });
  }

  @override
  void initState() {
    getLocation();
  }
}
