import '../model/ride_pref/ride_pref.dart';
import '../repository/ride_repository.dart';

import '../dummy_data/dummy_data.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
// class RidesService {

//   // static List<Ride> availableRides = fakeRides;  


//   ///
//   ///  Return the relevant rides, given the passenger preferences
//   ///
//   static List<Ride> getRidesFor(RidePreference preferences) {
 
//     // For now, just a test
//     return availableRides.where( (ride) => ride.departureLocation == preferences.departure && ride.arrivalLocation == preferences.arrival).toList();
//   }
 
// }
class RidesFilter{
  final bool acceptPets;

  RidesFilter({required this.acceptPets});
}

class RidesService {

  // static const List<Location> availableLocations = fakeLocations; 
  static RidesService? _instance; 
   final RideRepository repository;

  RidesService._internal(this.repository){}


 static void initialize(RideRepository repository) {
    if (_instance == null) {
      _instance = RidesService._internal(repository);
    } else {
      throw Exception("LocationsService is already initialized.");
    }
  }  
 
 ///
  /// Singleton accessor
  ///
  static RidesService get instance{
    if (_instance == null){
      throw Exception("RideService is not initialized. Call initialized() first.");
    }
    return _instance!;
  }
  List<Ride> getRides(RidePreference preferences, RidesFilter? filter){
    return repository.getRides(preferences, filter);
  }
  }


