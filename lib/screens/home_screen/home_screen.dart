import 'package:flutter/material.dart';
import 'package:starters_bloc/models/food.dart';
import 'package:starters_bloc/screens/home_screen/widgets/food_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Starters"),
      ),
      body: ListView(
        children: [
          FoodListItem(foodItem: Food.foodSampleOne),
          FoodListItem(foodItem: Food.foodSampleTwo),
          FoodListItem(foodItem: Food.foodSampleThree),
        ],
      ),
    );
  }
}
