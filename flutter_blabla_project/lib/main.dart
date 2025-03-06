import 'package:flutter/material.dart';
import 'package:flutter_blabla_project/repository/mock/mock_locations_repository.dart';
import 'package:flutter_blabla_project/repository/mock/mock_ride_preferences_repository.dart';
import 'package:flutter_blabla_project/service/locations_service.dart';
import 'screens/ride_pref/ride_pref_screen.dart';
import 'service/ride_prefs_service.dart';
import 'theme/theme.dart';
import 'package:flutter_blabla_project/widgets/inputs/location_picker.dart';

void main() {

  // 1 - Initialize the services
  RidePrefService.initialize(MockRidePreferencesRepository());
  LocationsService.initialize(MockLocationsRepository());

  // 2- Run the UI
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(body: RidePrefScreen()),
    );
  }
}
