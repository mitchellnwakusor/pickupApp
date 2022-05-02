import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PassengerDestination extends StatefulWidget {
  const PassengerDestination({Key? key}) : super(key: key);

  @override
  State<PassengerDestination> createState() => _PassengerDestinationState();
}

class _PassengerDestinationState extends State<PassengerDestination> {

  late GoogleMapController mapController;
  static const _initialPosition =LatLng(8.5174, 7.5766);
  LatLng _lastPosition= _initialPosition;
  final Set<Marker> _makers ={};

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Map(),
    );
  }
}


class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {

  late GoogleMapController mapController;
  static const _initialPosition =LatLng(8.5174, 7.5766);
  LatLng _lastPosition= _initialPosition;
  final Set<Marker> _makers ={};

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:  [
        GoogleMap(initialCameraPosition: CameraPosition(target: _initialPosition ,zoom: 12.0),
        onMapCreated: onCreated,
          myLocationEnabled: true,
          compassEnabled: true,
          markers: _makers,
          onCameraMove: _onCameraMove,
        ),
        Positioned(
          top: 40,
            right: 10,
            child:
            FloatingActionButton(
              onPressed: _addMakerPressed,
              tooltip: "add marker0",
              backgroundColor: Colors.black,
              child: const Icon(Icons.add_location,color: Colors.white,),
            ),
        ),
      ],
    );
  }

  void onCreated(GoogleMapController controller) {
  setState(() {
    mapController=controller;
  });
  }

  void _onCameraMove(CameraPosition position) {
    setState(() {
      _lastPosition=position.target;
    });
  }

  void _addMakerPressed() {
    setState(() {
      _makers.add(Marker(markerId: MarkerId(_lastPosition.toString()),
      position: _lastPosition,
        infoWindow: InfoWindow(
            title: "this place is awesome",
        snippet: "Good place",
        ),
        icon: BitmapDescriptor.defaultMarker,

      ),);
    });
  }
}

