import 'package:flutter/material.dart';
import 'package:starters_bloc/constants/strings.dart';
import 'package:starters_bloc/models/food.dart';
import 'package:starters_bloc/screens/details_screen/widgets/details_description.dart';
import 'package:starters_bloc/screens/details_screen/widgets/details_image.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.foodItem});

  final Food foodItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: const Text(kDetailViewTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailsImage(foodItem: foodItem),
            DetailsDescription(foodItem: foodItem)
          ],
        ),
      ),
    );
  }
}
