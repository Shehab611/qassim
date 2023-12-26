import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/components/custom_loader.dart';
import 'package:qassim/core/components/no_data_screen.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';
import 'package:qassim/features/favourites/data/repositories/favourites_repo_impl.dart';
import 'package:qassim/features/home/data/repositories/place_details/place_details_repo_impl.dart';
import 'package:qassim/features/home/presentation/view_model_manger/place_details_cubit/place_details_cubit.dart';
import 'package:qassim/service_locator.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String placeId = ModalRoute.of(context)?.settings.arguments as String;
    return BlocProvider(
      create: (context) => PlaceDetailsCubit(sl<PlaceDetailRepoImpl>(), sl<FavouritesRepoImpl>())
        ..getPlaceDetails(context, placeId),
      child: BlocBuilder<PlaceDetailsCubit, PlaceDetailsState>(
        builder: (context, state) {
          if (state is PlaceDetailsGetDataSuccessState) {
            return Scaffold(
              appBar: AppBar(
                title: Text(state.model.name),
              ),
              bottomNavigationBar: ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<PlaceDetailsCubit>(context).addToFavouritesPlaces(context, placeId);
                      },
                      child: Text(
                        AppLocalizations.of(context).translate(AppStrings.addToFavourites),
                        style: AppTextStyles.elevatedButtonTextStyle,
                      )),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<PlaceDetailsCubit>(context)
                            .navigateToCompleteBookingScreen(context, placeId);
                      },
                      child: Text(
                        AppLocalizations.of(context).translate(AppStrings.booking),
                        style: AppTextStyles.elevatedButtonTextStyle,
                      )),
                ],
              ),
              body: Column(
                children: [
                  ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(35)),
                    child: CachedNetworkImage(
                      imageUrl: state.model.images,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: '${AppLocalizations.of(context).translate(AppStrings.type)} :',
                        style: AppTextStyles.secondaryTextStyle,
                        children: [TextSpan(text: state.model.type)]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(state.model.data),
                  )
                ],
              ),
            );
          } else if (state is PlaceDetailsGetDataLoadingState) {
            return const Scaffold(
              body: CustomLoader(),
            );
          }
          return Scaffold(
            appBar: AppBar(),
            body: const NoDataScreen(),
          );
        },
      ),
    );
  }
}
