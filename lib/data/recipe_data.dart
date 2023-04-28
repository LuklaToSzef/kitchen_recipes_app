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
    categories: ['Dinner', 'All'],
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
    categories: ['Dinner', 'All'],
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
     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkIMxUKmq_XRK9xSLMQTNM5T6zutoIfVM-0g&usqp=CAU',
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
     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjv8XImXmE29lH5Vur722-Uui4zIC-MDE8cg&usqp=CAU',
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
     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsyOj8l0ibllC3qAM4UBdSS2gt59ilSEIa0g&usqp=CAU',
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
     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYwDQ6SPH7nTvKSU11NPWT2BKWDToOLIcPjQ&usqp=CAU',
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
   Recipe(
     title: 'Classic Cheeseburger',
     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnLEJWFMbNZnNNJHXDrm0P0f16rinrjNrbGQ&usqp=CAU',
     prepTime: 10,
     cookTime: 10,
     ingredients: ['ground beef', 'cheddar cheese', 'lettuce', 'tomato', 'onion', 'buns'],
     instructions: [
       'Form ground beef into 4 patties and season with salt and pepper.',
       'Grill patties for 4-5 minutes on each side until cooked through.',
       'Top each patty with a slice of cheddar cheese and cook until melted.',
       'Toast buns on the grill or in the oven.',
       'Assemble burgers by placing a patty on the bottom bun and topping with lettuce, tomato, and onion.',
       'Serve with your favorite condiments and enjoy!',
     ],
     favorite: false,
     categories: ['Fast Food', 'All'],
     difficulty: 2,
   ),

   Recipe(
     title: 'Mediterranean Chickpea Salad',
     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaA_bR0MzFwTqmedtPMtOvcrVRUXFdXkgc8w&usqp=CAU',
     prepTime: 15,
     cookTime: 0,
     ingredients: ['chickpeas', 'cucumber', 'tomato', 'red onion', 'feta cheese', 'olives', 'lemon juice', 'olive oil', 'garlic', 'salt', 'pepper'],
     instructions: [
       'Drain and rinse chickpeas, then transfer to a large bowl.',
       'Dice cucumber, tomato, and red onion and add to the bowl with the chickpeas.',
       'Chop olives and crumble feta cheese and add to the bowl.',
       'In a small bowl, whisk together lemon juice, olive oil, minced garlic, salt, and pepper to make the dressing.',
       'Pour the dressing over the salad and toss to combine.',
       'Refrigerate for at least 30 minutes before serving to allow flavors to meld together.',
       'Enjoy!',
     ],
     favorite: false,
     categories: ['Healthy', 'Vegan', 'All'],
     difficulty: 1,
   ),

   Recipe(
     title: 'Shrimp Scampi',
     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKxeadpN8pNWvNX67UaF5GxXnoKIkSP5qDxw&usqp=CAU',
     prepTime: 10,
     cookTime: 10,
     ingredients: ['spaghetti', 'shrimp', 'butter', 'olive oil', 'garlic', 'white wine', 'lemon juice', 'parsley', 'salt', 'pepper'],
     instructions: [
       'Cook spaghetti according to package instructions.',
       'In a large skillet, melt butter with olive oil over medium heat.',
       'Add minced garlic and cook until fragrant, about 1 minute.',
       'Add shrimp to the skillet and cook until pink, about 2-3 minutes per side.',
       'Remove shrimp from the skillet and set aside.',
       'Add white wine and lemon juice to the skillet and bring to a simmer.',
       'Add cooked spaghetti and chopped parsley to the skillet and toss to combine.',
       'Add shrimp back to the skillet and toss to combine.',
       'Season with salt and pepper to taste.',
       'Serve immediately and enjoy!',
     ],
     favorite: false,
     categories: ['Seafood', 'Dinner', 'All'],
     difficulty: 2,
   ),
   Recipe(
     title: 'Chicken Fajitas',
     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJrrTrIsQFoUf9CjLoQ2vlBiBn96F0-KMQ5A&usqp=CAU',
     prepTime: 15,
     cookTime: 15,
     ingredients: ['chicken', 'bell peppers', 'onion', 'tortillas', 'sour cream'],
     instructions: [
       'Season chicken with fajita seasoning and cook in a skillet until browned and cooked through.',
       'Add sliced bell peppers and onion to the skillet and cook until tender.',
       'Serve the chicken and vegetables in warm tortillas with a dollop of sour cream.',
     ],
     favorite: false,
     categories: ['All', 'Fast Food'],
     difficulty: 2,
   ),

   Recipe(
     title: 'Tomato Soup',
     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8q3UZJpFLGEZuv2_8d3oiUayl-z32CwWIxg&usqp=CAU',
     prepTime: 10,
     cookTime: 25,
     ingredients: ['tomatoes', 'onion', 'garlic', 'chicken broth', 'heavy cream'],
     instructions: [
       'Cook onion and garlic in a large saucepan until tender.',
       'Add tomatoes and chicken broth to the saucepan and bring to a simmer.',
       'Simmer for 15-20 minutes, then puree with an immersion blender.',
       'Stir in heavy cream and season with salt and pepper to taste.',
       'Serve hot, garnished with fresh herbs if desired.',
     ],
     favorite: false,
     categories: ['All', 'Healthy', 'Dinner'],
     difficulty: 1,
   ),
   Recipe(
     title: 'Grilled Chipotle Shrimp Tacos',
     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4MPrwbzzCGLOUbjLN_MigE9djbn_f5NbMpQ&usqp=CAU',
     prepTime: 15,
     cookTime: 10,
     ingredients: ['shrimp', 'corn tortillas', 'chipotle pepper', 'lime juice', 'red cabbage', 'avocado', 'sour cream'],
     instructions: [
       'Preheat grill to medium-high heat.',
       'In a mixing bowl, combine shrimp, chipotle pepper, and lime juice. Toss to coat.',
       'Grill shrimp for 2-3 minutes per side, or until cooked through.',
       'Warm tortillas on the grill for 10-15 seconds per side.',
       'To assemble tacos, divide shrimp among tortillas. Top with sliced red cabbage, diced avocado, and a dollop of sour cream.',
       'Serve immediately.',
     ],
     favorite: false,
     categories: ['Seafood', 'Spicy', 'All'],
     difficulty: 2,
   ),
   Recipe(
     title: 'Vegan Chickpea Curry',
     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyeSWmv3HJOIO6gN9Tix4bKH5bs_7MLbwJCA&usqp=CAU',
     prepTime: 15,
     cookTime: 30,
     ingredients: ['chickpeas', 'coconut milk', 'tomatoes', 'onion', 'garlic', 'ginger', 'curry powder'],
     instructions: [
       'Heat a large saucepan over medium heat. Add onion, garlic, and ginger, and cook until softened.',
       'Add curry powder and cook for 1-2 minutes, stirring constantly.',
       'Add chickpeas, coconut milk, and chopped tomatoes. Bring to a simmer.',
       'Cover and cook for 20-25 minutes, or until chickpeas are tender and sauce has thickened.',
       'Serve over rice or with naan bread.',
     ],
     favorite: false,
     categories: ['Vegan', 'Spicy', 'Healthy', 'All'],
     difficulty: 3,
   ),
   Recipe(
     title: 'Baked Cinnamon French Toast Casserole',
     imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUjfFU6dElRgWbyrOdu3Gs7MKVW2Dl1AkeGA&usqp=CAU',
     prepTime: 15,
     cookTime: 45,
     ingredients: ['bread', 'eggs', 'milk', 'heavy cream', 'cinnamon', 'vanilla extract', 'brown sugar', 'butter', 'maple syrup'],
     instructions: [
       'Preheat oven to 350°F (175°C). Grease a 9x13-inch baking dish.',
       'Cut bread into 1-inch cubes and place in the baking dish.',
       'In a mixing bowl, whisk together eggs, milk, heavy cream, cinnamon, vanilla extract, and brown sugar.',
       'Pour the egg mixture over the bread cubes. Use a spatula to press down on the bread cubes, making sure they are evenly coated.',
       'Melt butter and drizzle over the top of the bread cubes. Sprinkle with additional cinnamon.',
       'Bake for 40-45 minutes, or until the top is golden brown and the center is set.',
       'Serve with maple syrup and additional butter if desired.',
     ],
     favorite: false,
     categories: ['Breakfast', 'Desserts', 'All'],
     difficulty: 2,
   )

 ];
