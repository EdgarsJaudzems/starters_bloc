import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starters_bloc/bloc/food_bloc/food_bloc.dart';
import 'package:starters_bloc/constants/sizes.dart';
import 'package:starters_bloc/constants/strings.dart';
import 'package:starters_bloc/resources/sql_manager.dart';
import 'package:starters_bloc/screens/home_screen/widgets/food_list_item.dart';
import 'package:starters_bloc/widgets/snackBar.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: SqlManager().getAllFoodListFromDB(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        padding: const EdgeInsets.all(kPaddingMarginSmall),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final item = snapshot.data!;
                          return Dismissible(
                            key: Key(item[index].id.toString()),
                            onDismissed: (direction) {
                              SqlManager().deleteFoodFromDB(item[index].id!);
                              showSnackBar(context,
                                  text:
                                      '${item[index].name} $kSnackBarRemoveFromOrder');
                            },
                            background: Container(
                              color: Colors.red,
                              child: const Center(
                                child: Text(
                                  kDeleteItem,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            child: FoodListItem(foodItem: item[index]),
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text(kNoOrders));
                    }
                  })),
          ElevatedButton(
              onPressed: () async {
                showSnackBar(context, text: kSnackBarOrder);
                print(SqlManager()..getAllFoodListFromDB());
              },
              child: const Text(kSendOrder)),
          const SizedBox(height: kSizedBoxExtraLarge),
        ],
      ),
    );
  }
}
