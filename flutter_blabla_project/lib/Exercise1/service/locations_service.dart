import 'package:flutter_blabla_project/model/ride/locations.dart';
import 'package:flutter_blabla_project/repository/locations_repository.dart';

import '../dummy_data/dummy_data.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {

  // static const List<Location> availableLocations = fakeLocations; 
  static LocationsService? _instance; 
   final LocationsRepository repository;

  LocationsService._internal(this.repository){}


 static void initialize(LocationsRepository repository) {
    if (_instance == null) {
      _instance = LocationsService._internal(repository);
    } else {
      throw Exception("LocationsService is already initialized.");
    }
  }  
 
 ///
  /// Singleton accessor
  ///
  static LocationsService get instance{
    if (_instance == null){
      throw Exception("LocationService is not initialized. Call initialized() first.");
    }
    return _instance!;
  }
  List<Location> getLocations() {
    return repository.getLocations();
  }
}

