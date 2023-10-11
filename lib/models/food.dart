// ignore_for_file: public_member_api_docs, sort_constructors_first

class Food {
  final String name;
  final String description;
  final double price;
  final String imageURL;

  Food({
    required this.name,
    required this.description,
    required this.price,
    required this.imageURL,
  });

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
