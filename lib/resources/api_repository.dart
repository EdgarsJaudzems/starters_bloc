import 'package:starters_bloc/models/food.dart';
import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<FoodResponse> fetchFoodItemList() {
    return _provider.fetchFoodItemList();
  }
}

class NetworkError extends Error {}
