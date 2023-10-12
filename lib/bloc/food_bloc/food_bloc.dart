import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starters_bloc/models/food.dart';
import 'package:starters_bloc/resources/api_repository.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  List<Food> orderList = [];

  FoodBloc() : super(FoodInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetFoodItemsList>((event, emit) async {
      try {
        emit(FoodLoading());
        final mList = await apiRepository.fetchFoodItemList();
        emit(FoodSuccess(mList));
        if (mList.error != null) {
          emit(FoodFailure(mList.error));
        }
      } on NetworkError {
        emit(const FoodFailure("Failed to fetch data. is your device online?"));
      }
    });
  }
}
