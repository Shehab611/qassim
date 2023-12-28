import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:qassim/core/components/custom_loader.dart';
import 'package:qassim/core/components/no_data_screen.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/features/drawer/presentation/view/app_drawer.dart';
import 'package:qassim/features/map/presentation/view_model_manger/map_cubit.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate(AppStrings.map)),
      ),
      drawer: const AppDrawer(),
      body: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          if (state is MapSuccessState) {
            return InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(state.url)),
            );
          } else if (state is MapLoadingState) {
            return const CustomLoader();
          }
          return const NoDataScreen();
        },
      ),
    );
  }
}
