import 'package:flutter/material.dart';
import 'package:native_device_features/presentation/screens/add_places_screen.dart';
import 'package:native_device_features/provider/great_places.dart';
import 'package:provider/provider.dart';


class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Places"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: Consumer<GreatPlacesProvider>(
        builder: (ctx, greatPlaces, ch) {
          return greatPlaces.items.length == 0 ? Center(
            child: const Text('Got no places yet, start adding some!'),
          ) :
          ListView.builder(
            itemCount: greatPlaces.items.length,
            itemBuilder: (ctx, i) => ListTile(
              leading: CircleAvatar(
                backgroundImage: FileImage(
                  greatPlaces.items[i].image,
                ),
              ),
              title: Text(greatPlaces.items[i].title),
              onTap: () {
                // Go to detail page ...
              },
            ),
          );
        }
      ),
    );
  }
}

