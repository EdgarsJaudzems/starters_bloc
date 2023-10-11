import 'package:flutter/material.dart';
import 'package:starters_bloc/models/food.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.foodItem});

  final Food foodItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(foodItem.name!),
        ],
      ),
    );
  }
}
