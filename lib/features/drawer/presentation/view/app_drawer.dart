import 'package:flutter/material.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/app_routes_utils/app_paths.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_images.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';
import 'package:qassim/features/drawer/presentation/components/list_tile_component.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  static List<({IconData icon, String title, String routePath})> tileData = [
    (
      icon: Icons.home,
      title: AppStrings.homePage,
      routePath: AppPathName.kHomeScreen
    ),
    (
      icon: Icons.bookmark_added_sharp,
      title: AppStrings.previousBooking,
      routePath: AppPathName.kHomeScreen
    ),
    (
      icon: Icons.miscellaneous_services,
      title: AppStrings.customerService,
      routePath: AppPathName.kCustomerServiceScreen
    ),
    (
      icon: Icons.person,
      title: AppStrings.profile,
      routePath: AppPathName.kProfileScreen
    ),
    (
      icon: Icons.favorite,
      title: AppStrings.favouritePlaces,
      routePath: AppPathName.kHomeScreen
    ),
    (
      icon: Icons.category_outlined,
      title: AppStrings.categories,
      routePath: AppPathName.kHomeScreen
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.complementaryColor1,
      width: 260,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 5),
          child: Column(
            children: [
              Image.asset(AppImages.blackDarkLogo),
              const Padding(
                padding: EdgeInsets.only(bottom: AppSizes.paddingSizeDefault),
                child: Center(
                  child: Text(
                    'Shehab Ehab',
                    style: AppTextStyles.elevatedButtonTextStyle,
                  ),
                ),
              ),
              ...List.generate(
                  tileData.length,
                  (index) => ListTileComponent(
                      iconData: tileData[index].icon,
                      titleKey: tileData[index].title,
                      routeName: tileData[index].routePath)),
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
                        const Text(
                          "EN",
                          style: TextStyle(fontSize: 16),
                        ),
                        Switch(
                            value: true,
                            activeColor: AppColors.complementaryColor2,

                            onChanged: (bool? x) {}),
                        const Text("AR", style: TextStyle(fontSize: 16)),
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
  }
}
