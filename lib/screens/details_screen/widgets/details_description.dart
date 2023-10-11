import 'package:flutter/material.dart';
import 'package:starters_bloc/constants/colors.dart';
import 'package:starters_bloc/models/food.dart';

class DetailsDescription extends StatelessWidget {
  const DetailsDescription({super.key, required this.foodItem});

  final Food foodItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height - 350,
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
          const Row(
            children: [
              Text(
                'Price',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${foodItem.price}",
              style: const TextStyle(
                wordSpacing: 1.2,
                height: 1.5,
                fontSize: 16,
              ),
            ),
          )
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
