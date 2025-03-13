import 'package:flutter_blabla_project/model/ride/ride.dart';
import 'package:flutter_blabla_project/model/ride_pref/ride_pref.dart';
import '../service/rides_service.dart';
import '/model/ride/locations.dart';

abstract class RideRepository {

  List<Ride> getRides(RidePreference preferences, RidesFilter? filter,);
}