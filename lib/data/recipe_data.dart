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
    categories: ['Pasta', 'Italian', 'All'],
    difficulty: 2,
  ),
  Recipe(
    title: 'Chicken Alfredo',
    imageUrl: 'https://www.budgetbytes.com/wp-content/uploads/2022/07/Chicken-Alfredo-bowl.jpg',
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
    categories: ['Pasta', 'Italian', 'All'],
    difficulty: 3,
  ),
   Recipe(
     title: 'Fish Tacos',
     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSmIaKs7ru-2uLY3FXoltYK7U8VN3IEt1Drw&usqp=CAU',
     prepTime: 10,
     cookTime: 15,
     ingredients: ['tilapia fillets', 'flour tortillas', 'cabbage', 'salsa'],
     instructions: [
       'Heat oil in a large skillet over medium-high heat.',
       'Season tilapia fillets with salt and pepper and cook in the skillet until browned and cooked through.',
       'Warm up flour tortillas in a separate pan.',
       'Shred cabbage and assemble tacos with cooked fish, cabbage, and salsa.',
       'Serve immediately.',
     ],
     favorite: false,
     categories: ['Fast Food', 'Seafood','All'],
     difficulty: 2,
   ),
   Recipe(
     title: 'Quinoa Salad',
     imageUrl: '',
     prepTime: 10,
     cookTime: 20,
     ingredients: ['quinoa', 'cherry tomatoes', 'cucumber', 'red onion', 'feta cheese'],
     instructions: [
       'Cook quinoa according to package instructions.',
       'Chop cherry tomatoes, cucumber, and red onion.',
       'In a large mixing bowl, toss cooked quinoa with chopped vegetables and crumbled feta cheese.',
       'Serve immediately, or chill in the fridge until ready to serve.',
     ],
     favorite: false,
     categories: ['Vegan', 'Healthy','All'],
     difficulty: 1,
   ),
   Recipe(
     title: 'Blueberry Pancakes',
     imageUrl: '',
     prepTime: 10,
     cookTime: 10,
     ingredients: ['flour', 'baking powder', 'sugar', 'salt', 'eggs', 'milk', 'blueberries'],
     instructions: [
       'In a large mixing bowl, whisk together flour, baking powder, sugar, and salt.',
       'In a separate bowl, beat eggs and milk together.',
       'Add the wet ingredients to the dry ingredients and stir until just combined.',
       'Fold in blueberries.',
       'Heat a nonstick pan over medium heat and grease lightly with butter or oil.',
       'Pour batter onto the pan in 1/4 cup portions.',
       'Cook until bubbles form on the surface, then flip and cook until golden brown.',
       'Serve immediately, topped with additional blueberries and maple syrup if desired.',
     ],
     favorite: false,
     categories: ['Breakfast', 'Desserts','All'],
     difficulty: 2,
   ),
   Recipe(
     title: 'Vegan Buddha Bowl',
     imageUrl: '',
     prepTime: 15,
     cookTime: 30,
     ingredients: ['quinoa', 'chickpeas', 'sweet potato', 'avocado', 'spinach'],
     instructions: [
       'Cook quinoa according to package instructions.',
       'Peel and dice the sweet potato, and roast in the oven for 25 minutes.',
       'Rinse and drain chickpeas, then pan fry for 5-7 minutes.',
       'Slice avocado.',
       'Assemble the bowl: Add quinoa to the bottom of the bowl, followed by the roasted sweet potato, chickpeas, avocado, and spinach.',
       'Drizzle with your favorite vegan dressing and serve.',
     ],
     favorite: false,
     categories: ['Vegan', 'Healthy','All'],
     difficulty: 2,
   ),
   Recipe(
     title: 'Grilled Shrimp Skewers',
     imageUrl: 'https://www.wholesomeyum.com/wp-content/uploads/2021/07/wholesomeyum-Grilled-Shrimp-Skewers-Recipe-13.jpg',
     prepTime: 10,
     cookTime: 8,
     ingredients: ['shrimp', 'lemon', 'garlic', 'olive oil', 'salt'],
     instructions: [
       'Preheat grill to medium-high heat.',
       'Peel and devein shrimp, and place on skewers.',
       'In a small bowl, mix together minced garlic, lemon juice, olive oil, and salt.',
       'Brush the mixture onto the shrimp skewers.',
       'Grill the skewers for 2-3 minutes per side, until shrimp are pink and cooked through.',
       'Serve hot, garnished with lemon wedges and chopped parsley if desired.',
     ],
     favorite: false,
     categories: ['Seafood', 'Fast Food','All'],
     difficulty: 1,
   ),
   Recipe(
     title: 'Banana Pancakes',
     imageUrl: '',
     prepTime: 10,
     cookTime: 10,
     ingredients: ['flour', 'baking powder', 'salt', 'milk', 'banana', 'egg', 'butter'],
     instructions: [
       'In a large mixing bowl, whisk together flour, baking powder, and salt.',
       'In a separate bowl, mash the banana with a fork, then whisk in milk, egg, and melted butter.',
       'Add the wet ingredients to the dry ingredients and mix until just combined.',
       'Heat a non-stick pan over medium-high heat. Once hot, use a 1/4 cup measure to scoop batter onto the pan for each pancake.',
       'Cook for 2-3 minutes on each side, until golden brown and cooked through.',
       'Serve hot, with your favorite pancake toppings.',
     ],
     favorite: false,
     categories: ['Breakfast', 'Healthy','All'],
     difficulty: 2,
   ),

 ];
