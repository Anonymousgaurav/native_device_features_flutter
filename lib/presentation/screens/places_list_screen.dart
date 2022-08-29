import 'package:flutter/material.dart';
import 'package:native_device_features/presentation/screens/add_places_screen.dart';
import 'package:native_device_features/presentation/screens/places_detail_screen.dart';
import 'package:native_device_features/provider/great_places.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlacesProvider>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlacesProvider>(builder: (ctx, greatPlaces, ch) {
                return greatPlaces.items.isEmpty
                    ? const Center(
                        child: Text('Got no places yet, start adding some!'),
                      )
                    : ListView.builder(
                        itemCount: greatPlaces.items.length,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                              greatPlaces.items[i].image,
                            ),
                          ),
                          title: Text(greatPlaces.items[i].title),
                          subtitle: Text(greatPlaces.items[i].location.address),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              PlaceDetailScreen.routeName,
                              arguments: greatPlaces.items[i].id,
                            );
                          },
                        ),
                      );
              }),
      ),
    );
  }
}
