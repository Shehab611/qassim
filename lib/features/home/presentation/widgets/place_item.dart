import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';

class PlaceItem extends StatelessWidget {
  const PlaceItem({super.key, required this.imagePath, required this.title, required this.category});

  final String imagePath, title, category;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
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
