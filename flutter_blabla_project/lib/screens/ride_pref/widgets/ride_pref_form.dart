import 'package:flutter/material.dart';
import 'package:flutter_blabla_project/screens/rides/ride_screen.dart';
import 'package:intl/intl.dart';
import 'package:flutter_blabla_project/dummy_data/dummy_data.dart';
import 'package:flutter_blabla_project/theme/theme.dart';
import 'package:flutter_blabla_project/widgets/display/bla_divider.dart';
import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';
import 'dart:math';
import '../../../widgets/actions/BlaButton.dart';
import 'package:flutter_blabla_project/widgets/inputs/location_picker.dart';
import 'package:flutter_blabla_project/widgets/inputs/location_tile.dart';

final Random random = Random();

/// A Ride Preference Form is a view to select:
///   - A departure location
///   - An arrival location
///   - A date
///   - A number of seats
/// The form can be created with an existing RidePref (optional).
/// This is the form to select a ride preference.

class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({
    super.key,
    this.initRidePref,
  });

  @override
  State<RidePrefForm> createState() => _RidePrefFormState(); // Create the state
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure; 
  Location? arrival;

  late DateTime departureDate; 
  late int requestedSeats; 

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  /// Initialize the state with the initial RidePref.
  @override
  void initState() {
    super.initState();

    departure = widget.initRidePref
        ?.departure; // Set departure and arrival (default to empty if null)
    arrival = widget.initRidePref?.arrival;
    departureDate = widget.initRidePref?.departureDate ?? DateTime.now();
    // Set the departure date to now if not set

    requestedSeats = widget.initRidePref?.requestedSeats ?? 1;
    // Set the requested seats to 1 if not set
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------

  /// Show the date picker to select a departure date.
  void selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: departureDate,
      firstDate: DateTime(2023), // Set a reasonable first date
      lastDate: DateTime(2101), // Set a reasonable last date
    );

    if (pickedDate != null && pickedDate != departureDate) {
      // 1- If the user selected a date, update the state
      setState(() {
        departureDate = pickedDate;
      });
    }
  }
  // ----------------------------------
  // Location Selection
  // ----------------------------------

  // Function to select the departure location
  void _selectDepartureLocation() async {
    final Location? selectedLocation = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationPicker(
          onLocationSelected: (location) {
            setState(() {
              departure = location;
              Navigator.pop(context);
            });
          },
        ),
      ),
    );

    if (selectedLocation != null) {
      setState(() {
        departure = selectedLocation;
      });
    }
  }

// Function to select the arrival location
  void _selectArrivalLocation() async {
    final Location? selectedLocation = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationPicker(
          onLocationSelected: (location) {
            setState(() {
              arrival = location;
              Navigator.pop(context);
            });
          },
        ),
      ),
    );

    if (selectedLocation != null) {
      setState(() {
        arrival = selectedLocation;
      });
    }
  }

  //switchlocation
  void switchLocations() {
    setState(() {
      final temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }

  //submit
  void submit() {
    // 1- Check input validity
     if (departure == null || arrival == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        backgroundColor: BlaColors.neutral,
                        content: Text(
                          "Please select both locations",
                          style: BlaTextStyles.label,
                        )),
                  );
                  return;
                }

                final currentPref = RidePref(
                  departure: departure!,
                  arrival: arrival!,
                  departureDate: departureDate,
                  requestedSeats: requestedSeats,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RidesScreen(selectedPref: currentPref),
                  ),
                );
  }
void _showLocation(BuildContext context, bool isDeparture) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => LocationPicker(
          onLocationSelected: (location) {
            setState(
                () => isDeparture ? departure = location : arrival = location);
            Navigator.pop(context);
          },
        ),
      ),
    );
  
}

  // ----------------------------------
  // Build the widgets
  // ----------------------------------

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InputTile(
          icon: Icons.radio_button_off,
          title: departure?.name ?? "Select Departure",
          trailingIcon: Icons.swap_vert,
          onPressed: switchLocations,
          onTap: _selectDepartureLocation,
        ),
        const BlaDivider(),
        InputTile(
          icon: Icons.radio_button_off,
          title: arrival?.name ?? "Select Arrival",
          trailingIcon: null,
          onTap: _selectArrivalLocation,
        ),
        const BlaDivider(),
        InputTile(
          icon: Icons.date_range,
          title: DateFormat.yMMMd().format(departureDate),
          trailingIcon: null,
          onTap: selectDate,
        ),
        const BlaDivider(),
        InputTile(
          icon: Icons.people,
          title: "$requestedSeats seats",
          trailingIcon: null,
          onTap: () {},
        ),
        BlaButton(text: "Search", onPressedbutton: submit),
        
      ],
    );
  }
}

class InputTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final IconData? trailingIcon;
  final VoidCallback onTap;
  final VoidCallback? onPressed;

  const InputTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.trailingIcon,
      required this.onTap,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: BlaTextStyles.body,
          ),
          trailing: IconButton(
            onPressed: onPressed,
            icon: Icon(trailingIcon),
            color: BlaColors.primary,
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}


