import 'package:flutter/material.dart';
import 'package:native_device_features/presentation/screens/add_places_screen.dart';
import 'package:native_device_features/presentation/screens/places_detail_screen.dart';
import 'package:native_device_features/presentation/screens/places_list_screen.dart';
import 'package:native_device_features/provider/great_places.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GreatPlacesProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName: (context) => const AddPlaceScreen(),
          PlaceDetailScreen.routeName: (ctx) => const PlaceDetailScreen(),
        },
      ),
    );
  }
}
