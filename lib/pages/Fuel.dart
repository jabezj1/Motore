import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:motore/services/auth.dart';

class Fuel extends StatelessWidget {
  const Fuel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: const [
          Text(
            'Fuel map Page',
            style: TextStyle(
                fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 100,
          ),
          CircleAvatar(
            radius: 70,
            child: Icon(Icons.people, size: 120),
          ),
          SizedBox(
            height: 100,
          ),
          Text(
            'Fuel map Content',
            style: TextStyle(fontSize: 40, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

// class Fuel extends StatefulWidget {
//   @override
//   _FuelState createState() => _FuelState();
// }

// class _FuelState extends State<Fuel> {
//   static const _intialCameraPosition =
//       CameraPosition(target: LatLng(40.776676, -73.971321), zoom: 11.5);

//   late GoogleMapController _googleMapController;
//   late Marker _origin;
//   late Marker _destination;

//   // static const empty = null;

//   @override
//   void dispose() {
//     _googleMapController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         initialCameraPosition: _intialCameraPosition,
//         zoomControlsEnabled: false,
//         myLocationEnabled: false,
//         onMapCreated: (controller) => _googleMapController = controller,
//         markers: {
//           if (_origin != null) _origin,
//           if (_destination != null) _destination
//         },
//         onLongPress: _addMarker,
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Theme.of(context).primaryColor,
//         foregroundColor: Colors.black,
//         onPressed: () => _googleMapController.animateCamera(
//           CameraUpdate.newCameraPosition(_intialCameraPosition),
//         ),
//         child: const Icon(Icons.center_focus_strong),
//       ),
//     );
//   }

//   void _addMarker(LatLng pos) {
//     if (_origin == null || (_origin != null && _destination != null)) {
//       setState(() {
//         _origin = Marker(
//           markerId: const MarkerId('origin'),
//           infoWindow: const InfoWindow(title: 'Origin'),
//           icon:
//               BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//           position: pos,
//         );
//         //Reset destination
//         // _destination = empty;
//       });
//     } else {
//       setState(() {
//         _origin = Marker(
//           markerId: const MarkerId('destination'),
//           infoWindow: const InfoWindow(title: 'Destination'),
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//           position: pos,
//         );
//       });
//     }
//   }
// }

// class Fuel extends StatelessWidget {
//   final AuthService _auth = AuthService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Home Page'),
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//         actions: <Widget>[
//           ElevatedButton.icon(
//               onPressed: () async {
//                 await _auth.signOut();
//               },
//               icon: Icon(Icons.person),
//               label: Text('Log Out'))
//         ],
//       ),
//     );
//   }
// }
