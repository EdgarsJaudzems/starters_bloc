import 'package:dio/dio.dart';
import 'package:starters_bloc/models/food.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url =
      "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers";

  Future<FoodResponse> fetchFoodItemList() async {
    try {
      Response response = await _dio.get(_url);
      return FoodResponse.fromJson(response.data);
    } catch (error) {
      return FoodResponse.withError("Data not found / Connection issue");
    }
  }
}
