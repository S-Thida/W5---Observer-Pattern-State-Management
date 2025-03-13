import 'package:flutter/material.dart';
import 'package:flutter_blabla_project/dummy_data/dummy_data.dart';
import 'package:flutter_blabla_project/model/ride/locations.dart';
import 'package:flutter_blabla_project/model/ride/ride.dart';
import 'package:flutter_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:flutter_blabla_project/screens/rides/ride_card.dart';
import 'package:flutter_blabla_project/theme/theme.dart';
import 'package:flutter_blabla_project/utils/date_time_util.dart';

class RidesScreen extends StatelessWidget {
  final RidePreference selectedPref;
  const RidesScreen({super.key, required this.selectedPref});

  //
  // Checking Method to see if the location is matching within the data
  //
  bool _locationsMatch(Location a, Location b) {
    return a.name == b.name && a.country == b.country;
  }

  @override
  Widget build(BuildContext context) {
    // Filter rides based on selected preference
    final matchingRides = fakeRides.where((ride) {
      return _locationsMatch(ride.departureLocation, selectedPref.departure) &&
          _locationsMatch(ride.arrivalLocation, selectedPref.arrival);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Matching Rides"),
      ),

      // Check if there is matching rides, if not show message
      body: matchingRides.isEmpty
          ? Center(
              child: Text("No rides match for your preferences."),
            )
          : ListView.builder(
              itemCount: matchingRides.length,
              itemBuilder: (context, index) {
                final ride = matchingRides[index];
                return RideCard(
                  ride: ride,
                );
              },
            ),
    );
  }
}
