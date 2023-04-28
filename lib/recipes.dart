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
class SearchPage extends StatefulWidget {
  final String selectedCategory;

  const SearchPage({required this.selectedCategory});

  @override
  _SearchPageState createState() => _SearchPageState();
}
/////////////////////////////SEARCH//////////////////////////////////

final fieldText = TextEditingController();
class _SearchPageState extends  State<SearchPage>{
  List<Recipe> filteredRecipes = [];
  List<Recipe> filteredRecipesByTitle = [];
  String searchText = '';
  @override

  void initState() {
    super.initState();
    // filter recipes by selected category
    filteredRecipes = recipes
        .where((recipe) => recipe.categories.contains(widget.selectedCategory))
        .toList();
    filteredRecipesByTitle = filteredRecipes;
  }
  void search(String query) {
    setState(() {
      // filter recipes by title that matches the search query
      filteredRecipesByTitle = filteredRecipes
          .where((recipe) =>
          recipe.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
  void clearText(String query) {
    fieldText.clear();
    query = '';
    setState(() {
      filteredRecipesByTitle = filteredRecipes
          .where((recipe) =>
          recipe.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
  void transport() {
    if (widget.selectedCategory == 'Saved') {
      Navigator.of(context)
          .push(
          MaterialPageRoute(builder: (_) =>
              SavedScreen(selectedCategory: widget.selectedCategory)));
    } else {
      Navigator.of(context)
          .push(
          MaterialPageRoute(builder: (_) =>
              CategoriesScreen(selectedCategory: widget.selectedCategory)));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => transport(),
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
                onChanged: (text) {
                  setState(() {
                  searchText = text;
                  });
                  search(searchText);
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: (){
                      clearText(searchText);
                    },
                  ),
                  hintText: 'Search...',
                ),
              ),
            ),
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: filteredRecipesByTitle.map((recipe) {
            return Container(
              margin: const EdgeInsets.only(bottom: 30.0),
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
                    MaterialPageRoute(builder: (context) => RecipeDetails(recipe: recipe, categoryFrom: widget.selectedCategory)),
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
                      height: 240,
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
                          recipe.favorite ? Icons.star : Icons.star_border,
                          color: recipe.favorite ?  const Color.fromRGBO(72, 76, 180, 1.0) : const Color.fromRGBO(72, 76, 180, 1.0),
                        ),
                        iconSize: 40,
                        onPressed: () {
                          setState(() {
                            recipe.favorite = !recipe.favorite;
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 240),
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CategoryScreen()),
                        );
                      },
                      child: const Icon(Icons.category, color: Colors.white70, size: 35),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Categories',
                      style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 12),
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
                      child: Icon(Icons.restaurant_menu, size: 35, color: Constants().kSecondaryBlue),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Recipes',
                      style: TextStyle(color: Constants().kSecondaryBlue, fontWeight: FontWeight.bold, fontSize: 12),
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
                          MaterialPageRoute(builder: (context) => const SavedScreen(selectedCategory: 'Saved')),
                        );
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

/////////////////////////////RECIPES//////////////////////////////////

class _CategoriesScreenState extends State<CategoriesScreen>{
  List<Recipe> filteredRecipes = [];
  List<Recipe> filteredRecipesByTitle = [];
  @override

  void initState() {
    super.initState();
    // filter recipes by selected category
    filteredRecipes = recipes
        .where((recipe) => recipe.categories.contains(widget.selectedCategory))
        .toList();
  }
  void search(String query) {
    setState(() {
      // filter recipes by title that matches the search query
      filteredRecipesByTitle = filteredRecipes
          .where((recipe) =>
          recipe.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
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
                    MaterialPageRoute(builder: (_) => SearchPage(selectedCategory: widget.selectedCategory))),
            icon: const Icon(Icons.search),
            iconSize: 40,
          )
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: filteredRecipes.map((recipe) {
            return Container(
              margin: const EdgeInsets.only(bottom: 30.0),
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
                    MaterialPageRoute(builder: (context) => RecipeDetails(recipe: recipe, categoryFrom: widget.selectedCategory)),
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
                      height: 240,
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
                          recipe.favorite ? Icons.star : Icons.star_border,
                          color: recipe.favorite ?  const Color.fromRGBO(72, 76, 180, 1.0) : const Color.fromRGBO(72, 76, 180, 1.0),
                        ),
                        iconSize: 40,
                        onPressed: () {
                          setState(() {
                            recipe.favorite = !recipe.favorite;
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 240),
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CategoryScreen()),
                        );
                      },
                      child: const Icon(Icons.category, color: Colors.white70, size: 35),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Categories',
                      style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 12),
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
                      child: Icon(Icons.restaurant_menu, size: 35, color: Constants().kSecondaryBlue),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Recipes',
                      style: TextStyle(color: Constants().kSecondaryBlue, fontWeight: FontWeight.bold, fontSize: 12),
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
                          MaterialPageRoute(builder: (context) => const SavedScreen(selectedCategory: 'Saved')),
                        );
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