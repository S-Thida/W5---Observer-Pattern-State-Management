import '../../model/ride/locations.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../service/rides_service.dart';
import '../../utils/date_time_util.dart';
import '../../repository/mock/mock_ride_repository.dart';


void main() {
  // 1. Initialize with mock rides repository
  RidesService.initialize(MockRidesRepository());

  // 2. Create preference
  final preference = RidePreference(
    departure: Location(name: "Battambang", country: Country.cambodia),
    arrival: Location(name: "Siem Reap", country: Country.cambodia),
    departureDate: DateTime.now(),
    requestedSeats: 1,
  );

  // 3. Get filtered 
  RidesFilter filter = RidesFilter(acceptPets: true);
  final results = RidesService.instance.repository
      .getRides( preference,filter)
      .where((ride) => ride.availableSeats >= preference.requestedSeats).toList();

  // 4. Print header once
  print(
      'For your preference (${preference.departure.name} -> ${preference.arrival.name}, today ${preference.requestedSeats} passenger)');
  print('we found ${results.length} rides:');

  // 5. Print results
  for (final ride in results) {
    final duration = ride.arrivalDateTime.difference(ride.departureDate);
    print('- at ${DateTimeUtils.formatTime(ride.departureDate)} '
        '\twith ${ride.driver.firstName} '
        '(${duration.inHours} hours)');
  }
}