import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';

class PlaceItem extends StatelessWidget {
  const PlaceItem({super.key, required this.imagePath, required this.title, this.category, this.onTap});

  final String imagePath, title;
  final String? category;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 110,
        child: Card(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                clipBehavior: Clip.antiAlias,
                child: CachedNetworkImage(
                  imageUrl: imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                title,
                style: AppTextStyles.tileTextStyle,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
