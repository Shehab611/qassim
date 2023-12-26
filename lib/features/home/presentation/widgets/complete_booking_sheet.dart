import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/components/custom_loader.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';
import 'package:qassim/features/home/data/repositories/booking/booking_repo_impl.dart';
import 'package:qassim/features/home/presentation/view_model_manger/booking_cubit/booking_cubit.dart';
import 'package:qassim/service_locator.dart';

class CompleteBookingSheet extends StatelessWidget {
  const CompleteBookingSheet({super.key, required this.placeId});

  final String placeId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingCubit(sl<BookingRepoImpl>()),
      child: Container(
        height: MediaQuery.of(context).viewInsets.bottom + 220,
        decoration: const BoxDecoration(
            color: AppColors.darkerShadeColor1,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.paddingSizeSmall),
          child: BlocBuilder<BookingCubit, BookingState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                        color: AppColors.darkerShadeColor6, borderRadius: BorderRadius.circular(20)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    AppLocalizations.of(context).translate(AppStrings.completeBooking),
                    style: const TextStyle(
                        color: AppColors.complementaryColor3, fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        AppLocalizations.of(context).translate(AppStrings.pickTime),
                        style: AppTextStyles.secondaryTextStyle,
                      ),
                      DropdownButton<String>(
                        value: BookingCubit.get(context).selectedValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        style: AppTextStyles.secondaryTextStyle,
                        underline: Container(
                          height: 2,
                          color: AppColors.complementaryColor3,
                        ),
                        dropdownColor: AppColors.darkerShadeColor1,
                        onChanged: BookingCubit.get(context).changeSelectedValue,
                        items: BookingCubit.get(context).dropdownItems(context),
                      ),
                    ],
                  ),
                  (state is BookingLoadingState)
                      ? const CustomLoader()
                      : ElevatedButton(
                          onPressed: () {
                            BookingCubit.get(context).bookPlace(placeId, context);
                          },
                          child: Text(
                            AppLocalizations.of(context).translate(AppStrings.confirm),
                            style: AppTextStyles.elevatedButtonTextStyle,
                          ))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
