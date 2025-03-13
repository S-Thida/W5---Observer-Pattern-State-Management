import 'package:flutter_blabla_project/Exercise1/dummy_data/dummy_data.dart';
import 'package:flutter_blabla_project/Exercise1/listener/ride_preference_listener.dart';
import 'package:flutter_blabla_project/Exercise1/model/ride_pref/ride_pref.dart';
import 'package:flutter_blabla_project/Exercise1/repository/mock/mock_ride_preferences_repository.dart';
import 'package:flutter_blabla_project/Exercise1/service/ride_prefs_service.dart';


class ConsoleLogger implements RidePreferencesListener {
  @override
  void onPreferenceSelected(RidePreference selectednewPreference) {
    print("Ride Preference changed to: $selectednewPreference");
  }
}
void main(){

  // declared some test 
  final test1 = fakeRidePrefs[0]; 
  final test2 = fakeRidePrefs[1];

  // Initialize the service
RidePrefService.initialize(MockRidePreferencesRepository());
  final service = RidePrefService.instance;

  // Create and register the logger
  ConsoleLogger logger = ConsoleLogger();
  service.addListener(logger);

  print('Testing first preference change:');
  service.setCurrentPreference(test1);

  print("\nTesting second preference change:");
  service.setCurrentPreference(test2);
}