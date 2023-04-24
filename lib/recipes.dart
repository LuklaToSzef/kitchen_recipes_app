import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RecipesScreen(),
    );
  }
}
final fieldText = TextEditingController();
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  void clearText() {
    fieldText.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The search area here
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                controller: fieldText,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: (){
                        clearText();
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
            ),
          )),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                width: 140,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromRGBO(0, 184, 255, 1.0),
                ),
                child: const Center(child: Text('Categories',
                  style: TextStyle(fontSize: 25, color: Colors.white),))),
            Container(
                width: 120,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),

                  color: Colors.white,
                ),
                child: const Center(child: Text('Recipes',
                  style: TextStyle(fontSize: 25, color: Colors.black),))),
            Container(
                width: 120,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: const Center(child: Text('Saved',
                  style: TextStyle(fontSize: 25, color: Colors.black),))),
          ],
        ),
      ),
    );
  }
}
class RecipesScreen extends StatelessWidget {
  const RecipesScreen({Key? key}) : super(key: key);
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
          title: const Text("Category"),
          leading: IconButton(
            onPressed: () =>
                Navigator.of(context)
                    .push(
                    MaterialPageRoute(builder: (_) => const SearchPage())),
            icon: const Icon(Icons.search),
            iconSize: 40,
          )
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
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                width: 140,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromRGBO(0, 184, 255, 1.0),
                ),
                child: const Center(child: Text('Categories',
                  style: TextStyle(fontSize: 25, color: Colors.white),))),
            Container(
                width: 120,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),

                  color: Colors.white,
                ),
                child: const Center(child: Text('Recipes',
                  style: TextStyle(fontSize: 25, color: Colors.black),))),
            Container(
                width: 120,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: const Center(child: Text('Saved',
                  style: TextStyle(fontSize: 25, color: Colors.black),))),
          ],
        ),
      ),
    );
  }
}