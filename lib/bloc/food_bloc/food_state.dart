part of 'food_bloc.dart';

sealed class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object> get props => [];
}

final class FoodInitial extends FoodState {}

final class FoodLoading extends FoodState {}

final class FoodSuccess extends FoodState {
  final FoodResponse foodResponse;

  const FoodSuccess(this.foodResponse);
}

final class FoodFailure extends FoodState {
  final String? message;

  const FoodFailure(this.message);
}
