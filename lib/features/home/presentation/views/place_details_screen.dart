import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () {},
              child: Text(
                AppLocalizations.of(context).translate(AppStrings.addToFavourites),
                style: AppTextStyles.elevatedButtonTextStyle,
              )),
          ElevatedButton(
              onPressed: () {},
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
              imageUrl: 'https://th.bing.com/th/id/OIP.V5XDYGmtMaObFxADf1VgUAHaE6?rs=1&pid=ImgDetMain',
              height: 200,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          RichText(
            text: TextSpan(
                text: '${AppLocalizations.of(context).translate(AppStrings.type)} :',
                style: AppTextStyles.secondaryTextStyle,
                children: [TextSpan(text: 'مكان اثري')]),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                'يتميز هذا المكان بكونه مش عارف ايه و بني في عصر مش عارف ايه و يفيد انه احا الشبشب داع يتميز هذا المكان بكونه مش عارف ايه و بني في عصر مش عارف ايه و يفيد انه احا الشبشب داع يتميز هذا المكان بكونه مش عارف ايه و بني في عصر مش عارف ايه و يفيد انه احا الشبشب داع يتميز هذا المكان بكونه مش عارف ايه و بني في عصر مش عارف ايه و يفيد انه احا الشبشب داع يتميز هذا المكان بكونه مش عارف ايه و بني في عصر مش عارف ايه و يفيد انه احا الشبشب داع'),
          )
        ],
      ),
    );
  }
}
