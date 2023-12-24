import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/components/custom_loader.dart';
import 'package:qassim/core/components/no_data_screen.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/features/categories/presentation/view_model_manger/categories_cubit.dart';
import 'package:qassim/features/categories/presentation/widgets/category_item.dart';
import 'package:qassim/features/drawer/presentation/view/app_drawer.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title:
            Text(AppLocalizations.of(context).translate(AppStrings.categories)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingSizeSmall),
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesGetDataSuccessfulState) {
              return GridView.builder(
                  itemCount: state.model.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 8),
                  itemBuilder: (context, index) => CategoryItem(
                        height: 112,
                        imagePath: state.model.data[index].image,
                        title: state.model.data[index].name,
                      ));
            }
            if (state is CategoriesGetDataLoadingState) {
              return const CustomLoader();
            }
            return const NoDataScreen();
          },
        ),
      ),
    );
  }
}
