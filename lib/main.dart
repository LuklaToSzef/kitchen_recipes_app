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
      'icon': Icons.free_breakfast,
    },
    {
      'name': 'Seafood',
      'icon': Icons.fastfood,
    },
    {
      'name': 'Spicy',
      'icon': Icons.local_airport,
    },
    {
      'name': 'Healthy',
      'icon': Icons.local_dining,
    },
    {
      'name': 'Breakfast',
      'icon': Icons.local_bar,
    },
    {
      'name': 'Dinner',
      'icon': Icons.local_florist,
    },
    {
      'name': 'Desserts',
      'icon': Icons.local_see,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose category'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
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
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(144, 204, 252, 1.0),
                //rgb(144, 204, 252)
                boxShadow: const [
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    category['icon'] as IconData?,
                    size: 48,
                    color: const Color.fromRGBO(72, 76, 180, 1.0)
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category['name'] as String,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}