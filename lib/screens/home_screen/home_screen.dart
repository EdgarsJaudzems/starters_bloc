import 'package:flutter/material.dart';
import 'package:starters_bloc/models/food.dart';
import 'package:starters_bloc/screens/home_screen/widgets/food_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Starters"),
      ),
      body: ListView(
        children: [
          FoodListItem(foodItem: MockData.foodSampleOne),
          FoodListItem(foodItem: MockData.foodSampleTwo),
          FoodListItem(foodItem: MockData.foodSampleThree),
        ],
      ),
    );
  }
}
