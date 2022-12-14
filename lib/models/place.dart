import 'dart:io';

import 'package:flutter/foundation.dart';


class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
  });
}

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String? address;

  PlaceLocation({
    required this.latitude,
    required this.longitude,
    this.address,
  });

  factory PlaceLocation.empty() => PlaceLocation(latitude: 0.0,longitude: 0.0,address: "");

}

