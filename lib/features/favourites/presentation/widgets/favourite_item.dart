import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem(
      {super.key, required this.imagePath, required this.title});

  final String imagePath, title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(AppSizes.paddingSizeSmall),
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
