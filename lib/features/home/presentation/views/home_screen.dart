import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/components/custom_loader.dart';
import 'package:qassim/core/components/no_data_screen.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/features/drawer/presentation/view/app_drawer.dart';
import 'package:qassim/features/home/presentation/view_model_manger/all_places_cubit/all_places_cubit.dart';
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
      body: BlocBuilder<AllPlacesCubit, AllPlacesState>(
        builder: (context, state) {
          if (state is AllPlacesGetDataLoadingState) {
            return const CustomLoader();
          } else if (state is AllPlacesGetDataSuccessState) {
            if (state.model.data.isNotEmpty) {
              return ListView.builder(
                itemCount: state.model.data.length,
                itemBuilder: (context, index) {
                  return PlaceItem(
                      imagePath: state.model.data[index].images,
                      title: state.model.data[index].name,
                      category: state.model.data[index].type);
                },
              );
            }
          }
          return const NoDataScreen();
        },
      ),
    );
  }
}
