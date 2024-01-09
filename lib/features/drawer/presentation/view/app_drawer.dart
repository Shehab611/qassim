import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_images.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';
import 'package:qassim/features/drawer/presentation/components/list_tile_component.dart';
import 'package:qassim/features/drawer/presentation/view_model_manger/drawer_cubit.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerCubit(),
      child: BlocBuilder<DrawerCubit, DrawerState>(
        builder: (context, state) {
          DrawerCubit cubit = DrawerCubit.get(context);
          return Drawer(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.paddingSizeEight, vertical: AppSizes.paddingSizeExtraSmall),
                child: Column(
                  children: [
                    Image.asset(AppImages.blackDarkLogo),
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppSizes.paddingSizeDefault),
                      child: Center(
                        child: Text(
                          cubit.userName,
                          style: AppTextStyles.defaultTextStyle,
                        ),
                      ),
                    ),
                    ...List.generate(
                        cubit.tileData.length,
                        (index) => ListTileComponent(
                            iconData: cubit.tileData[index].icon,
                            titleKey: cubit.tileData[index].title,
                            routeName: cubit.tileData[index].routePath)),
                    Card(
                      elevation: 10,
                      child: ListTile(
                        leading: const Icon(Icons.language),
                        title: Text(AppLocalizations.of(context).translate(AppStrings.language)),
                        trailing: SizedBox(
                          width: 113,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("AR", style: AppTextStyles.switchTextStyle),
                              Transform.scale(
                                scale: 0.88,
                                child: Switch(
                                    value: cubit.switchValue,
                                    activeColor: AppColors.complementaryColor2,
                                    onChanged: cubit.changeLocale),
                              ),
                              const Text("EN", style: AppTextStyles.switchTextStyle),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
