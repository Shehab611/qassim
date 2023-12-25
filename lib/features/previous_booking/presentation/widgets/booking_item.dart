import 'package:flutter/material.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';

class BookingItem extends StatelessWidget {
  const BookingItem({super.key, required this.title, required this.visitDate});

  final String title, visitDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        subtitle: Text(
          visitDate,
        ),
        contentPadding: const EdgeInsets.all(AppSizes.paddingSizeExtraSmall),
        title: Text(title),
      ),
    );
  }
}
