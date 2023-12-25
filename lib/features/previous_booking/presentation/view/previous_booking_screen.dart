import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/components/custom_loader.dart';
import 'package:qassim/core/components/no_data_screen.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/features/drawer/presentation/view/app_drawer.dart';
import 'package:qassim/features/previous_booking/presentation/view_model_manger/previous_booking/previous_booking_cubit.dart';
import 'package:qassim/features/previous_booking/presentation/widgets/booking_item.dart';

class PreviousBookingScreen extends StatelessWidget {
  const PreviousBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate(AppStrings.previousBooking)),
        centerTitle: true,
      ),
      body: BlocBuilder<PreviousBookingCubit, PreviousBookingState>(
        builder: (context, state) {
          if (state is PreviousBookingGetDataLoadingState) {
            return const CustomLoader();
          } else if (state is PreviousBookingGetDataSuccessState) {
            if (state.model.data.isNotEmpty) {
              return ListView.builder(
                itemCount: state.model.data.length,
                itemBuilder: (context, index) {
                  return BookingItem(
                      title: state.model.data[index].placeName, visitDate: state.model.data[index].timeVisit);
                },
              );
            }
          }
          return const NoDataScreen();
        },
      ),
    );
  }
}
