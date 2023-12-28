import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';

class PlaceItem extends StatelessWidget {
  const PlaceItem(
      {super.key, required this.imagePath, required this.title, required this.category, this.onTap});

  final String imagePath, title, category;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        subtitle: Text(
          category,
        ),
        contentPadding: const EdgeInsets.all(AppSizes.paddingSizeExtraSmall),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          clipBehavior: Clip.antiAlias,
          child: CachedNetworkImage(
            imageUrl: imagePath,
            width: 80,
            height: null,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(title),
      ),
    );
  }
}

class PlaceSearchItem extends StatelessWidget {
  const PlaceSearchItem(
      {super.key, required this.imagePath, required this.title, required this.category, this.onTap});

  final String imagePath, title, category;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          subtitle: Text(category, style: AppTextStyles.tileSecondarySubTitleTextStyle),
          contentPadding: const EdgeInsets.all(AppSizes.paddingSizeExtraSmall),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            clipBehavior: Clip.antiAlias,
            child: CachedNetworkImage(
              imageUrl: imagePath,
              width: 80,
              height: null,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            title,
            style: AppTextStyles.tileSecondaryTextStyle,
          ),
        ),
        const Divider(
          thickness: 1.2,
          color: AppColors.lighterShadeColor1,
        )
      ],
    );
  }
}
