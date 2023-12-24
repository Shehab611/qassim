import 'package:flutter/material.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/features/drawer/presentation/view/app_drawer.dart';
import 'package:qassim/features/previous_booking/presentation/widgets/booking_item.dart';

class PreviousBookingScreen extends StatelessWidget {
  const PreviousBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context).translate(AppStrings.previousBooking)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => BookingItem(
            imagePath:
                'https://th.bing.com/th/id/OIP.KdugtnrFKbBBOhLZnWPR4gHaFj?w=251&h=188&c=7&r=0&o=5&pid=1.7',
            title: 'Place Title $index',
            visitDate: 'visitDate'),
      ),
    );
  }
}
