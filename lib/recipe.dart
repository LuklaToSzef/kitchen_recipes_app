import 'package:flutter/material.dart';
import 'package:kitchen_recipes_app/recipes.dart';
import 'package:kitchen_recipes_app/saved.dart';
import 'data/recipe_data.dart';
// ignore: unused_import
import 'main.dart';

class RecipeDetails extends StatefulWidget {
  final Recipe recipe;
  final String categoryFrom;
  const RecipeDetails({Key? key, required this.recipe, required this.categoryFrom}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.recipe.favorite;
  }
  void transport() {
    if (widget.categoryFrom == 'Saved') {
      Navigator.of(context)
          .push(
          MaterialPageRoute(builder: (_) =>
              SavedScreen(selectedCategory: widget.categoryFrom)));
    } else {
      Navigator.of(context)
          .push(
          MaterialPageRoute(builder: (_) =>
              CategoriesScreen(selectedCategory: widget.categoryFrom)));
    }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.title),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => transport(),
            icon: const Icon(Icons.arrow_back),
          iconSize: 35,
        ),
        actions: [

          IconButton(
            icon: Icon(
              _isFavorite ? Icons.star : Icons.star_border,
              color: _isFavorite ? const Color.fromRGBO(72, 76, 180, 1.0) : Colors.white,
            ),
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
                widget.recipe.favorite = _isFavorite;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FullScreenImage(imageUrl: widget.recipe.imageUrl),
                ));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                      color: const Color.fromRGBO(72, 76, 180, 1.0),
                      width: 3,
                    ),

                    image: DecorationImage(
                      image: NetworkImage(widget.recipe.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 280,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.timer),
                const SizedBox(width: 8),
                Text('${widget.recipe.prepTime} min prep'),
                const SizedBox(width: 16),
                const Icon(Icons.timer),
                const SizedBox(width: 8),
                Text('${widget.recipe.cookTime} min cook'),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.recipe.ingredients
                  .map((ingredient) => Text('- $ingredient'))
                  .toList(),
            ),
            const SizedBox(height: 16),
            Text(
              'Instructions',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.recipe.instructions
                  .asMap()
                  .entries
                  .map((entry) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Step ${entry.key + 1}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(entry.value),
                  const SizedBox(height: 8),
                ],
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          color: Colors.black,
          child: Center(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
