import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';
import 'package:qassim/features/profile/data/repositories/change_password_repo/change_password_repo_impl.dart';
import 'package:qassim/features/profile/presentation/components/edit_row.dart';
import 'package:qassim/features/profile/presentation/view_model_manger/change_password_cubit/change_password_cubit.dart';
import 'package:qassim/features/profile/presentation/widgets/change_password_sheet.dart';
import 'package:qassim/service_locator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
        backgroundColor: AppColors.complementaryColor2,
        title: Text(
          AppLocalizations.of(context).translate(AppStrings.profile),
          style: AppTextStyles.elevatedButtonTextStyle,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingSizeEight),
        child: SizedBox(
          height: size.height * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFieldWithIconButton(
                controller: TextEditingController()
                  ..text = 'shehabehab1029@gmail.com',
                enabled: false,
                icon: Icons.alternate_email,
                labelText:
                AppLocalizations.of(context).translate(AppStrings.email),
              ),
              TextFieldWithIconButton(
                controller: TextEditingController()
                  ..text = 'Shehab Ehab',
                enabled: false,
                icon: Icons.person,
                labelText:
                AppLocalizations.of(context).translate(AppStrings.fullName),
              ),
              TextFieldWithIconButton(
                controller: TextEditingController()
                  ..text = '01156538327',
                enabled: false,
                icon: Icons.call,
                labelText: AppLocalizations.of(context)
                    .translate(AppStrings.phoneNumber),
              ),
              ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return GestureDetector(
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                              child: BlocProvider(create: (context) =>
                                  ChangePasswordCubit(sl<ChangePasswordRepoImpl>()),
                                  child: const ChangePasswordSheet(),),);
                          },
                        );
                      },
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context)
                        .translate(AppStrings.changePassword),
                    style: AppTextStyles.elevatedButtonTextStyle,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
