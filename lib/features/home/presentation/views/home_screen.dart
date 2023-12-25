import 'package:flutter/material.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/features/drawer/presentation/view/app_drawer.dart';
import 'package:qassim/features/home/presentation/widgets/place_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context).translate(AppStrings.homePage)),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return const PlaceItem(imagePath: 'imagePath', title: 'title', visitDate: 'visitDate');
        },
      ),
    );
  }
}
