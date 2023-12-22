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
            backgroundColor: AppColors.complementaryColor1,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                child: Column(
                  children: [
                    Image.asset(AppImages.blackDarkLogo),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: AppSizes.paddingSizeDefault),
                      child: Center(
                        child: Text(
                          cubit.userName,
                          style: AppTextStyles.elevatedButtonTextStyle,
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
                        title: Text(AppLocalizations.of(context)
                            .translate(AppStrings.language)),
                        trailing: Transform.scale(
                          scale: .9,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("AR", style: TextStyle(fontSize: 16)),
                              Switch(
                                  value: cubit.switchValue,
                                  activeColor: AppColors.complementaryColor2,
                                  onChanged: (bool value) {
                                    cubit.changeLocale(value);
                                  }),
                              const Text(
                                "EN",
                                style: TextStyle(fontSize: 16),
                              ),
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
