import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Category Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CategoryScreen(),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  static const categories = [
    {
      'name': 'Fast Food',
      'icon': Icons.local_pizza,
    },
    {
      'name': 'Vegan',
      'icon': Icons.safety_divider,
    },
    {
      'name': 'Seafood',
      'icon': Icons.safety_divider,
    },
    {
      'name': 'Spicy',
      'icon': Icons.face,
    },
    {
      'name': 'Healthy',
      'icon': Icons.apple,
    },
    {
      'name': 'Breakfast',
      'icon': Icons.free_breakfast,
    },
    {
      'name': 'Dinner',
      'icon': Icons.local_dining,
    },
    {
      'name': 'Desserts',
      'icon': Icons.icecream,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Food Recipes'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
        ),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              // navigation here
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(144, 204, 252, 1.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    category['icon'] as IconData?,
                    size: 60,
                    color: const Color.fromRGBO(72, 76, 180, 1.0),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    category['name'] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MaterialButton(
              onPressed: () {},
              child: const Text('Categories', style: TextStyle(fontSize: 20),),),
            MaterialButton(
              onPressed: () {},
              child: const Text('Recipes', style: TextStyle(fontSize: 20),),),
            MaterialButton(
              onPressed: () {},
              child: const Text('Saved', style: TextStyle(fontSize: 20),),),
          ],
        ),
      ),
    );
  }
}