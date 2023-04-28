import 'package:flutter/material.dart';
import 'package:kitchen_recipes_app/saved.dart';
import 'recipes.dart';
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

class Constants{
  Color kPrimaryBlue= const Color.fromRGBO(144, 204, 252, 1.0);
  Color kSecondaryBlue= const Color.fromRGBO(72, 76, 180, 1.0);
  Color kBarsBlue= const Color.fromRGBO(0, 184, 255, 1.0);
}
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);
  static const categories = [
    {
      'name': 'Fast Food',
      'icon': Icons.fastfood,
    },
    {
      'name': 'Vegan',
      'icon': Icons.grass,
    },
    {
      'name': 'Seafood',
      'icon': Icons.set_meal,
    },
    {
      'name': 'Spicy',
      'icon': Icons.local_fire_department,
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
        automaticallyImplyLeading: false,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(30),
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoriesScreen(selectedCategory: category['name'] as String)),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Constants().kPrimaryBlue,
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
                      fontSize: 25.0,
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
        color: Colors.blue,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        notchMargin: 8,
        child: SizedBox(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      child: Icon(Icons.category, color: Constants().kSecondaryBlue, size: 35),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Categories',
                      style: TextStyle(color: Constants().kSecondaryBlue, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CategoriesScreen(selectedCategory: 'All')),
                        );
                      },
                      child: const Icon(Icons.restaurant_menu, color: Colors.white70, size: 35),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Recipes',
                      style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SavedScreen(selectedCategory: 'Saved')),                        );
                      },
                      child: const Icon(Icons.star, color: Colors.white70, size: 35),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Saved',
                      style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}