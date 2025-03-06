import '/model/ride/locations.dart';
import '/repository/locations_repository.dart';

class MockLocationsRepository extends LocationsRepository {
  final Location phnompenh=Location(name: "Phnom Penh", country: Country.cambodia);
  final Location battambang= Location(name: "Battambang", country: Country.cambodia);
  final Location sihanoukville=Location(name: "Sihanoukville", country: Country.cambodia);
  final Location kampot= Location(name: "Kampot", country: Country.cambodia);
  final Location siemreap= Location(name: "Siem Reap", country: Country.cambodia);
  @override
  List<Location> getLocations() {
    return [phnompenh, battambang, sihanoukville, kampot, siemreap];
  }
}