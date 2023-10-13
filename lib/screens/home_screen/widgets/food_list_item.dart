import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:starters_bloc/constants/colors.dart';
import 'package:starters_bloc/constants/sizes.dart';
import 'package:starters_bloc/models/food.dart';

class FoodListItem extends StatelessWidget {
  final Food foodItem;

  const FoodListItem({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPaddingMarginSmall),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(kBorderRadiusLarger),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadiusLarger),
              child: CachedNetworkImage(
                imageUrl: foodItem.imageURL!,
                width: 150,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(kPaddingMarginLarger),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodItem.name!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: kSizedBoxSmaller),
                    Row(
                      children: [
                        const Text(
                          '\$',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${foodItem.price}',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
