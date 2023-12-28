import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/components/custom_loader.dart';
import 'package:qassim/core/components/no_data_screen.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
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
              return CustomScrollView(
                physics: const NeverScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSizes.paddingSizeExtraSmall),
                      child: SizedBox(
                        height: 55,
                        child: SearchAnchor.bar(
                          barHintText: AppLocalizations.of(context).translate(AppStrings.search),
                          isFullScreen: false,
                          searchController: AllPlacesCubit.get(context).searchController,
                          suggestionsBuilder: (BuildContext builderContext, SearchController controller) {
                            final keyword = controller.value.text;
                            return List.generate(
                                state.model.data.length,
                                (index) => PlaceSearchItem(
                                    onTap: () {
                                      controller.closeView(state.model.data[index].name);
                                      FocusScope.of(builderContext).unfocus();
                                      AllPlacesCubit.get(context).navigateToPlaceDetails(
                                          context, state.model.data[index].id.toString());
                                    },
                                    imagePath: state.model.data[index].images,
                                    title: state.model.data[index].name,
                                    category: state.model.data[index].type)).where((element) =>
                                element.title.contains(keyword.toLowerCase()) ||
                                element.category.contains(keyword.toLowerCase()));
                          },
                        ),
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: true,
                    child: ListView.builder(
                      itemCount: state.model.data.length,
                      itemBuilder: (context, index) {
                        return PlaceItem(
                            onTap: () {
                              AllPlacesCubit.get(context)
                                  .navigateToPlaceDetails(context, state.model.data[index].id.toString());
                            },
                            imagePath:
                                'https://i.natgeofe.com/n/535f3cba-f8bb-4df2-b0c5-aaca16e9ff31/giza-plateau-pyramids.jpg?w=1200'
                            // state.model.data[index].images
                            ,
                            title: state.model.data[index].name,
                            category: state.model.data[index].type);
                      },
                    ),
                  )
                ],
              );
            }
          }
          return const NoDataScreen();
        },
      ),
    );
  }
}
