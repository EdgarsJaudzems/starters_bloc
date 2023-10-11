import 'package:flutter/material.dart';
import 'package:starters_bloc/models/food.dart';

class FoodListItem extends StatelessWidget {
  final Food foodItem;

  const FoodListItem({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                foodItem.imageURL,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodItem.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      foodItem.description,
                    ),
                    const SizedBox(height: 5),
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
