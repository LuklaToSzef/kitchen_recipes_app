class Recipe {
  final String title;
  final String imageUrl;
  final int prepTime;
  final int cookTime;
  final List<String> ingredients;
  final List<String> instructions;
  bool favorite;
  List<String> categories;
  final int difficulty;

  Recipe({
    required this.title,
    required this.imageUrl,
    required this.prepTime,
    required this.cookTime,
    required this.ingredients,
    required this.instructions,
    this.favorite = false,
    required this.categories,
    required this.difficulty,
  });

  String get image => imageUrl;
}

// List of recipes
 List<Recipe> recipes = [
  Recipe(
    title: 'Spaghetti Carbonara',
    imageUrl: 'https://www.cookingclassy.com/wp-content/uploads/2020/10/spaghetti-carbonara-01.jpg',
    prepTime: 10,
    cookTime: 20,
    ingredients: ['spaghetti', 'eggs', 'bacon', 'parmesan cheese'],
    instructions: [
      'Cook spaghetti according to package instructions.',
      'Fry bacon in a large skillet until crisp. Remove from skillet and crumble.',
      'In a mixing bowl, whisk together eggs and parmesan cheese.',
      'Drain spaghetti and add to the skillet with the bacon. Remove from heat and let cool for a minute.',
      'Add the egg mixture to the skillet and stir until the eggs are cooked and the pasta is coated.',
      'Serve immediately, garnished with additional parmesan cheese if desired.',
    ],
    favorite: false,
    categories: ['Pasta', 'Italian'],
    difficulty: 2,
  ),
  Recipe(
    title: 'Chicken Alfredo',
    imageUrl: 'https://www.example.com/chicken_alfredo.jpg',
    prepTime: 15,
    cookTime: 25,
    ingredients: ['fettuccine', 'chicken', 'heavy cream', 'parmesan cheese'],
    instructions: [
      'Cook fettuccine according to package instructions.',
      'Season chicken with salt and pepper and cook in a skillet until browned and cooked through.',
      'In a saucepan, heat heavy cream over medium heat until it starts to thicken.',
      'Add parmesan cheese and stir until melted.',
      'Add cooked fettuccine to the saucepan and toss until coated with the sauce.',
      'Serve immediately, topped with the cooked chicken and additional parmesan cheese if desired.',
    ],
    favorite: false,
    categories: ['Pasta', 'Italian'],
    difficulty: 3,
  ),
];
