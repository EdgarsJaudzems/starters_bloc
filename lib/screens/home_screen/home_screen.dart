import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starters_bloc/bloc/food_bloc/food_bloc.dart';
import 'package:starters_bloc/models/food.dart';
import 'package:starters_bloc/screens/home_screen/widgets/food_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FoodBloc foodBloc = FoodBloc();

  @override
  void initState() {
    foodBloc.add(GetFoodItemsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Starters"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (context) => foodBloc,
          child: BlocListener<FoodBloc, FoodState>(
            listener: (context, state) {
              if (state is FoodFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message!),
                  ),
                );
              }
            },
            child: BlocBuilder<FoodBloc, FoodState>(
              builder: (context, state) {
                if (state is FoodInitial) {
                  return _buildLoadingIndicator();
                } else if (state is FoodLoading) {
                  return _buildLoadingIndicator();
                } else if (state is FoodSuccess) {
                  return _buildFoodListItemCard(context, state.foodResponse);
                } else if (state is FoodFailure) {
                  return Container();
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFoodListItemCard(
      BuildContext context, FoodResponse foodResponse) {
    return ListView.builder(
      itemCount: foodResponse.request!.length,
      itemBuilder: (context, index) {
        return FoodListItem(foodItem: foodResponse.request![index]);
      },
    );
  }

  Widget _buildLoadingIndicator() =>
      const Center(child: CircularProgressIndicator());
}