import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class SimpleOsmPreview extends StatelessWidget {
  final double lat;
  final double lng;

  const SimpleOsmPreview({super.key, required this.lat, required this.lng});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // small preview height
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: FlutterMap(
          children: [
            TileLayer(
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              userAgentPackageName: 'com.example.carui',
            ),

            MarkerLayer(
              markers: [
                Marker(
                  child: Icon(Icons.location_pin, color: Colors.red, size: 30),
                  point: LatLng(lat, lng),
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
