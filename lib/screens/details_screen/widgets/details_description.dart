import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starters_bloc/bloc/food_bloc/food_bloc.dart';
import 'package:starters_bloc/constants/colors.dart';
import 'package:starters_bloc/constants/sizes.dart';
import 'package:starters_bloc/constants/strings.dart';
import 'package:starters_bloc/models/food.dart';
import 'package:starters_bloc/resources/sql_manager.dart';
import 'package:starters_bloc/widgets/snackbar.dart';

class DetailsDescription extends StatelessWidget {
  const DetailsDescription({super.key, required this.foodItem});

  final Food foodItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(kPaddingMarginSmall),
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
          const SizedBox(height: kSizedBoxLarger),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProductComposition(
                  composition: kCalories, amount: foodItem.calories as num),
              ProductComposition(
                  composition: kCarbs, amount: foodItem.carbs as num),
              ProductComposition(
                  composition: kProtein, amount: foodItem.protein as num),
            ],
          ),
          const SizedBox(height: kSizedBoxLarge),
          ElevatedButton(
              onPressed: () async {
                context.read<FoodBloc>().orderList.add(foodItem);
                SqlManager().insertFoodToDB(foodItem);
                showSnackBar(context, text: kItemAddedToOrder);
                await Future.delayed(const Duration(milliseconds: 200));
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
              child: const Text(kAddToOrder)),
          const SizedBox(height: kSizedBoxLarge),
          const Row(
            children: [
              Text(
                kDescription,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          ),
          const SizedBox(height: kSizedBoxSmall),
          Text(
            foodItem.description!,
            style: const TextStyle(
              wordSpacing: 1.2,
              height: 1.5,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: kSizedBoxExtraXLarge),
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
