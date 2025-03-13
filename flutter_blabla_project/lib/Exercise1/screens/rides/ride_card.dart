import 'package:flutter/material.dart';
import '../../model/ride/ride.dart';
import '../../theme/theme.dart';
import '../../utils/date_time_util.dart';

class RideCard extends StatelessWidget {
  final Ride ride;
  const RideCard({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Departure: ${ride.departureLocation.name} => Arrival: ${ride.arrivalLocation.name}",
              style: BlaTextStyles.body,
            ),
            SizedBox(height: 8),
            Text(
                "Time: ${DateTimeUtils.formatTime(ride.departureDate)} => ${DateTimeUtils.formatTime(ride.arrivalDateTime)}",
                style: BlaTextStyles.body),
                
          ],
        ),
      ),
    );
  }
}