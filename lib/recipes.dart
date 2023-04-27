import 'package:flutter/material.dart';
import 'package:kitchen_recipes_app/saved.dart';
import 'data/recipe_data.dart';
import 'recipe.dart';
import 'main.dart';

class CategoriesScreen extends StatefulWidget {
  final String selectedCategory;

  const CategoriesScreen({required this.selectedCategory});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

/////////////////////////////SEARCH//////////////////////////////////

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

/////////////////////////////RECIPES//////////////////////////////////

class _CategoriesScreenState extends State<CategoriesScreen>{
  bool _isFavorite = false;
  List<Recipe> filteredRecipes = [];

  @override
  void initState() {
    super.initState();
    // filter recipes by selected category
    filteredRecipes = recipes
        .where((recipe) => recipe.categories.contains(widget.selectedCategory))
        .toList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(widget.selectedCategory),
          leading: IconButton(
            onPressed: () =>
                Navigator.of(context)
                    .push(
                    MaterialPageRoute(builder: (_) => const SearchPage())),
            icon: const Icon(Icons.search),
            iconSize: 40,
          )
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: filteredRecipes.map((recipe) {
            return Container(
              margin: const EdgeInsets.only(bottom: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(
                    color: Constants().kSecondaryBlue,
                    width: 3,
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RecipeDetails(recipe: recipe)),
                  );
                },
                child: Stack (
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(45.0)),
                        image: DecorationImage(
                          image: NetworkImage(recipe.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 280,
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: IconButton(
                      icon: const Icon(Icons.star),
                      color: Colors.white,
                      iconSize: 35,
                      onPressed: () {
                      },
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        icon: Icon(
                          _isFavorite ? Icons.star_border : Icons.star,
                          color: _isFavorite ?  const Color.fromRGBO(72, 76, 180, 1.0) : const Color.fromRGBO(72, 76, 180, 1.0),
                        ),
                        iconSize: 40,
                        onPressed: () {
                          setState(() {
                            _isFavorite = !_isFavorite;
                            recipe.favorite = _isFavorite;
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 280),
                          Text(
                            recipe.title,
                            style: const TextStyle(fontSize: 20.0),
                          ),
                          const SizedBox(height: 8.0),
                          Text('${recipe.prepTime + recipe.cookTime} minutes'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SavedScreen(selectedCategory: 'All')),
                );
              },
            child: Container(
                width: 120,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: const Center(child: Text('Saved',
                  style: TextStyle(fontSize: 23, color: Colors.black),))),
            ),
          ],
        ),
      ),
    );
  }
}

