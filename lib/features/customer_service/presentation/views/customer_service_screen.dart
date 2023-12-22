import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/components/custom_loader.dart';
import 'package:qassim/core/components/custom_snack_bar.dart';
import 'package:qassim/core/components/custom_text_field.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';
import 'package:qassim/features/customer_service/presentation/view_model_manger/customer_service_cubit.dart';
import 'package:qassim/features/drawer/presentation/view/app_drawer.dart';

class CustomerServiceScreen extends StatelessWidget {
  const CustomerServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context).translate(AppStrings.customerService),
          style: AppTextStyles.elevatedButtonTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingSizeDefault),
        child: SingleChildScrollView(
          child: BlocConsumer<CustomerServiceCubit, CustomerServiceState>(
            listener: (context, state) {
              if (state is CustomerServiceSuccessState) {
                showCustomSnackBar(
                    AppLocalizations.of(context)
                        .translate(AppStrings.sendSuccessfully),
                    context,
                    inTop: true,
                    isError: false);
              } else if (state is CustomerServiceUserDataFailedState) {
                showCustomSnackBar(state.errorMessage, context);
              }
            },
            builder: (context, state) {
              CustomerServiceCubit cubit = CustomerServiceCubit.get(context);
              return Column(
                children: [
                  CustomTextField(
                    controller: cubit.nameController,
                    prefixIcon: Icons.person,
                    required: true,
                    labelText: AppLocalizations.of(context)
                        .translate(AppStrings.fullName),
                  ),
                  const SizedBox(
                    height: AppSizes.paddingSizeDefault,
                  ),
                  CustomTextField(
                    controller: cubit.subjectController,
                    required: true,
                    labelText: AppLocalizations.of(context)
                        .translate(AppStrings.subject),
                  ),
                  const SizedBox(
                    height: AppSizes.paddingSizeDefault,
                  ),
                  CustomTextField(
                    controller: cubit.messageController,
                    maxLines: 8,
                    required: true,
                    labelText: AppLocalizations.of(context)
                        .translate(AppStrings.message),
                  ),
                  const SizedBox(
                    height: AppSizes.paddingSizeDefault,
                  ),
                  (state is CustomerServiceLoadingState)
                      ? const CustomLoader()
                      : ElevatedButton(
                          style: cubit.buttonEnabled()
                              ? null
                              : ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                          AppColors.complementaryColor2
                                              .withOpacity(0.4))),
                          onPressed: () {
                            cubit.buttonEnabled()
                                ? cubit.sendFeedBack(context)
                                : null;
                          },
                          child: Text(
                            AppLocalizations.of(context)
                                .translate(AppStrings.confirm),
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
