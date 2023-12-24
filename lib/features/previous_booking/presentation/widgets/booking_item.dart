import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';

class BookingItem extends StatelessWidget {
  const BookingItem(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.visitDate});

  final String imagePath, title, visitDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        subtitle: Text(
          visitDate,
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
