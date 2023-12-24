import 'package:flutter/material.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/features/drawer/presentation/view/app_drawer.dart';
import 'package:qassim/features/favourites/presentation/widgets/favourite_item.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //858
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            AppLocalizations.of(context).translate(AppStrings.favouritePlaces)),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Dismissible(
          key: ValueKey(index),
          background: Container(
            color: Colors.red,
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Icon(Icons.delete, color: Colors.white),
            ),
          ),
          confirmDismiss: (direction) async {
            //use cubit to remove item from the list
            return true;
          },
          direction: DismissDirection.endToStart,
          child: FavouriteItem(
            imagePath:
                'https://th.bing.com/th/id/OIP.KdugtnrFKbBBOhLZnWPR4gHaFj?w=251&h=188&c=7&r=0&o=5&pid=1.7',
            title: 'Place Title $index',
          ),
        ),
        itemCount: 10,
      ),
    );
  }
}
