import 'package:flutter/material.dart';
import 'package:starters_bloc/screens/home_screen/home_screen.dart';
import 'package:starters_bloc/screens/orders_screen/orders_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Starters App Bloc'),
              bottom: const TabBar(tabs: [
                Tab(icon: Icon(Icons.set_meal)),
                Tab(icon: Icon(Icons.store))
              ]),
            ),
            body: const TabBarView(
              children: [
                HomeScreen(),
                OrdersScreen()
              ],
            ),
          )),
    );
  }
}
