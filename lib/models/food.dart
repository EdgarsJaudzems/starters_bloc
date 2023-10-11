// ignore_for_file: public_member_api_docs, sort_constructors_first

class FoodResponse {
  List<Food>? request;
  String? error;

  FoodResponse({this.request});

  FoodResponse.withError(String errorMessage) {
    error = errorMessage;
  }

  FoodResponse.fromJson(Map<String, dynamic> json) {
    if (json['request'] != null) {
      request = <Food>[];
      json['request'].forEach((v) {
        request!.add(Food.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (request != null) {
      data['request'] = request!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Food {
  String? name;
  String? imageURL;
  int? protein;
  int? carbs;
  double? price;
  int? id;
  String? description;
  int? calories;

  Food(
      {this.name,
      this.imageURL,
      this.protein,
      this.carbs,
      this.price,
      this.id,
      this.description,
      this.calories});

  Food.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageURL = json['imageURL'];
    protein = json['protein'];
    carbs = json['carbs'];
    price = json['price'];
    id = json['id'];
    description = json['description'];
    calories = json['calories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['imageURL'] = imageURL;
    data['protein'] = protein;
    data['carbs'] = carbs;
    data['price'] = price;
    data['id'] = id;
    data['description'] = description;
    data['calories'] = calories;
    return data;
  }
}

class MockData {
  static Food foodSampleOne = Food(
      name: "Test 1",
      description: "Description 1",
      price: 20,
      imageURL: "assets/test_image.jpg");

  static Food foodSampleTwo = Food(
      name: "Test 2",
      description: "Description 2",
      price: 20,
      imageURL: "assets/test_image.jpg");

  static Food foodSampleThree = Food(
      name: "Test 3",
      description: "Description 3",
      price: 20,
      imageURL: "assets/test_image.jpg");

  static List<Food> listOfFoodItems = [
    foodSampleOne,
    foodSampleTwo,
    foodSampleThree
  ];
}
