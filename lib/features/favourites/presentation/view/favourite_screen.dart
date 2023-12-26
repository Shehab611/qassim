import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/components/custom_loader.dart';
import 'package:qassim/core/components/no_data_screen.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/features/drawer/presentation/view/app_drawer.dart';
import 'package:qassim/features/favourites/presentation/view_model_manger/favourites_cubit/favourites_cubit.dart';
import 'package:qassim/features/favourites/presentation/widgets/favourite_item.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            AppLocalizations.of(context).translate(AppStrings.favouritePlaces)),
      ),
      body: BlocBuilder<FavouritesCubit, FavouritesState>(
        builder: (context, state) {
          FavouritesCubit cubit = FavouritesCubit.get(context);
          if (state is FavouritesGetDataFailedState) {
            return const NoDataScreen();
          } else if (state is FavouritesLoadingState) {
            return const CustomLoader();
          }
          if (cubit.favouritePlaces.allPlace.isNotEmpty) {
            return ListView.builder(
              itemCount: cubit.favouritePlaces.allPlace.length,
              itemBuilder: (context, index) => Dismissible(
                key: ValueKey(cubit.favouritePlaces.allPlace[index].id),
                background: Container(
                  color: Colors.red,
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                ),
                confirmDismiss: (direction) async {
                  cubit.removeFromFavouritesPlaces(context, cubit.favouritePlaces.allPlace[index]);
                  return true;
                },
                direction: DismissDirection.endToStart,
                child: FavouriteItem(
                  imagePath: cubit.favouritePlaces.allPlace[index].images,
                  title: cubit.favouritePlaces.allPlace[index].name,
                ),
              ),
            );
          } else {
            return const NoDataScreen();
          }
        },
      ),
    );
  }
}
