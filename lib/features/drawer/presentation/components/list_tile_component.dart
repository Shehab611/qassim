import 'package:flutter/material.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_routes_utils/app_navigator.dart';

class ListTileComponent extends StatelessWidget {
  const ListTileComponent(
      {super.key,
      required this.iconData,
      required this.titleKey,
      required this.routeName});

  final IconData iconData;
  final String titleKey, routeName;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ListTile(
        leading: Icon(iconData),
        trailing: const Icon(Icons.navigate_next),
        title: Text(AppLocalizations.of(context).translate(titleKey)),
        onTap: () {
          if (ModalRoute.of(context)!.settings.name! == routeName) {
            Navigator.pop(context);
          } else {
            AppNavigator.navigateToScreen(context, routeName);
          }
        },
      ),
    );
  }
}
