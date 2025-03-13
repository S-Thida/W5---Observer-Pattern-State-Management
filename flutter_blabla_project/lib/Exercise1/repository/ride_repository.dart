import '../model/ride/ride.dart';
import '../model/ride_pref/ride_pref.dart';
import '../service/rides_service.dart';
import '../model/ride/locations.dart';

abstract class RideRepository {

  List<Ride> getRides(RidePreference preferences, RidesFilter? filter,);
}