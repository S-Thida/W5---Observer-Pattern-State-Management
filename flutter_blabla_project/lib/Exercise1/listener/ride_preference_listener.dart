import 'package:flutter_blabla_project/Exercise1/model/ride_pref/ride_pref.dart';

abstract class RidePreferencesListener {
  void onPreferenceSelected(RidePreference selectedPreference);
}