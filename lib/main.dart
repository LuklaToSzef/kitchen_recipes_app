import 'package:flutter/material.dart';
import 'package:kitchen_recipes_app/data/recipe_data.dart';
import 'recipe.dart';
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
      'name': 'Recipe',
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
                MaterialPageRoute(
                  builder: (context) => RecipeDetails(recipe: recipes.last),
                ),
              );
              // navigation here
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
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: Container(
                width: 140,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromRGBO(0, 184, 255, 1.0),
                ),
                child: const Center(
                  child: Text(
                    'Categories',
                    style: TextStyle(fontSize: 23, color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RecipesScreen()),
                );
              },
              child: Container(
                width: 120,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: const Center(
                  child: Text(
                    'Recipes',
                    style: TextStyle(fontSize: 23, color: Colors.black),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecipeDetails(recipe: recipes.first)),
                );
              },
              child: Container(
                width: 120,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: const Center(
                  child: Text(
                    'Saved',
                    style: TextStyle(fontSize: 23, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}