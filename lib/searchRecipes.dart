import 'package:flutter/material.dart';
import 'package:kitchen_recipes_app/recipes.dart';
import 'package:kitchen_recipes_app/saved.dart';
import 'data/recipe_data.dart';
import 'recipe.dart';
import 'main.dart';

class SearchPage extends StatefulWidget {
  final String selectedCategory;

  const SearchPage({required this.selectedCategory});

  @override
  _SearchPageState createState() => _SearchPageState();
}

/////////////////////////////SEARCH//////////////////////////////////

final fieldText = TextEditingController();
class _SearchPageState extends State<SearchPage>{
  List<Recipe> filteredRecipes = [];
  _SearchPageState({Key? key});
  void clearText() {
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () =>
                Navigator.of(context)
                    .push(
                    MaterialPageRoute(builder: (_) =>  const CategoriesScreen(selectedCategory: 'All'))),
            icon: const Icon(Icons.arrow_back),
            iconSize: 35,
          ),
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
                ),
              ),
            ),
          )),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CategoryScreen()),
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
                    'Categories',
                    style: TextStyle(fontSize: 23, color: Colors.black),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
              },
              child: Container(
                width: 140,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromRGBO(0, 184, 255, 1.0),
                ),
                child: const Center(
                  child: Text(
                    'Recipes',
                    style: TextStyle(fontSize: 23, color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
                width: 120,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: const Center(child: Text('Saved',
                  style: TextStyle(fontSize: 23, color: Colors.black),))),
          ],
        ),
      ),
    );
  }
}