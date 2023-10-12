import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starters_bloc/bloc/food_bloc/food_bloc.dart';
import 'package:starters_bloc/constants/colors.dart';
import 'package:starters_bloc/models/food.dart';

class DetailsDescription extends StatelessWidget {
  const DetailsDescription({super.key, required this.foodItem});

  final Food foodItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      color: kBackgroundColor,
      child: Column(
        children: [
          Text(
            foodItem.name!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProductComposition(
                  composition: "kCal", amount: foodItem.calories as num),
              ProductComposition(
                  composition: "Carbs", amount: foodItem.carbs as num),
              ProductComposition(
                  composition: "Protein", amount: foodItem.protein as num),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                context.read<FoodBloc>().orderList.add(foodItem);
                print("Added");
                print(context.read<FoodBloc>().orderList.length);
                Navigator.pop(context);
              },
              child: const Text("Add to Order")),
          const SizedBox(height: 30),
          const Row(
            children: [
              Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            foodItem.description!,
            style: const TextStyle(
              wordSpacing: 1.2,
              height: 1.5,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class ProductComposition extends StatelessWidget {
  const ProductComposition({
    super.key,
    required this.composition,
    required this.amount,
  });

  final String composition;
  final num amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          composition,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text("$amount"),
      ],
    );
  }
}
