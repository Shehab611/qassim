import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/components/custom_loader.dart';
import 'package:qassim/core/components/no_data_screen.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';
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
                      padding: const EdgeInsets.all(4),
                      child: SizedBox(
                        height: 55,
                        child: SearchAnchor.bar(
                          barBackgroundColor:
                              const MaterialStatePropertyAll<Color>(AppColors.complementaryColor3),
                          barHintText: AppLocalizations.of(context).translate(AppStrings.search),
                          barHintStyle:
                              const MaterialStatePropertyAll<TextStyle>(AppTextStyles.defaultTextStyle),
                          isFullScreen: false,
                          barTextStyle:
                              const MaterialStatePropertyAll<TextStyle>(AppTextStyles.defaultTextStyle),
                          viewBackgroundColor: AppColors.complementaryColor3,
                          barLeading: const Icon(
                            Icons.search_sharp,
                            color: AppColors.lighterShadeColor1,
                          ),
                          searchController: AllPlacesCubit.get(context).searchController,
                          suggestionsBuilder: (BuildContext context, SearchController controller) {
                            final keyword = controller.value.text;
                            return List.generate(5, (index) => 'Item $index')
                                .where((element) => element.toLowerCase().startsWith(keyword.toLowerCase()))
                                .map((item) => GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        controller.closeView(item);
                                      },
                                      child: ListTile(
                                        title: Text(item, style: const TextStyle(color: Colors.white)),
                                        onTap: () {
                                          controller.closeView(item);
                                          FocusScope.of(context).unfocus();
                                        },
                                      ),
                                    ));
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
