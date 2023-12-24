import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.imagePath,
      required this.title,
      this.width,
      this.height});

  final String imagePath;
  final String title;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
          color: AppColors.complementaryColor1,
          borderRadius: BorderRadius.circular(24)
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            clipBehavior: Clip.antiAlias,
            child: CachedNetworkImage(
              imageUrl: imagePath,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.defaultTextStyle,
          )
        ],
      ),
    );
  }
}
