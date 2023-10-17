import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starters_bloc/bloc/food_bloc/food_bloc.dart';
import 'package:starters_bloc/constants/sizes.dart';
import 'package:starters_bloc/models/food.dart';
import 'package:starters_bloc/resources/sql_manager.dart';
import 'package:starters_bloc/screens/details_screen/details_screen.dart';
import 'package:starters_bloc/screens/home_screen/widgets/food_list_item.dart';
import 'package:starters_bloc/widgets/snackBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(kPaddingMarginSmall),
        child: BlocListener<FoodBloc, FoodState>(
          listener: (context, state) {
            if (state is FoodFailure) {
              showSnackBar(context, text: state.message!);
            }
          },
          child: BlocBuilder<FoodBloc, FoodState>(
            builder: (context, state) {
              if (state is FoodInitial) {
                context.read<FoodBloc>().add(GetFoodItemsList());
                SqlManager().database;
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
    );
  }

  Widget _buildFoodListItemCard(
      BuildContext context, FoodResponse foodResponse) {
    return ListView.builder(
      itemCount: foodResponse.request!.length,
      itemBuilder: (context, index) {
        var foodItem = foodResponse.request![index];
        return InkWell(
          child: FoodListItem(foodItem: foodItem),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => DetailsScreen(foodItem: foodItem))));
          },
        );
      },
    );
  }

  Widget _buildLoadingIndicator() =>
      const Center(child: CircularProgressIndicator());
}
