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
              child: Image.network(
                width: 150,
                foodItem.imageURL!,
                fit: BoxFit.cover,
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
