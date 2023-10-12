import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starters_bloc/bloc/food_bloc/food_bloc.dart';
import 'package:starters_bloc/models/food.dart';
import 'package:starters_bloc/screens/home_screen/widgets/food_list_item.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    List<Food> ordersList = context.read<FoodBloc>().orderList;
    return Scaffold(
      body: (ordersList.isEmpty)
          ? const Center(child: Text("No orders added"))
          : Container(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: ordersList.length,
                itemBuilder: (context, index) {
                  final item = ordersList[index];
                  return Dismissible(
                    key: Key(item.id.toString()),
                    onDismissed: (direction) {
                      setState(() {
                        ordersList.removeAt(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('${item.name} removed from order')));
                    },
                    background: Container(color: Colors.red),
                    child: FoodListItem(foodItem: ordersList[index]),
                  );
                },
              ),
            ),
    );
  }
}
