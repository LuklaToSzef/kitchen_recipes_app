import 'package:flutter/material.dart';
import 'main.dart';
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
                    MaterialPageRoute(builder: (_) => const RecipesScreen())),
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
                  MaterialPageRoute(builder: (context) => CategoryScreen()),
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

////////////////////////////RECIPES//////////////////////////////////

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({Key? key}) : super(key: key);

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
      body: Center(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
            Container(
            height: 100,
            width: 100,
          child: TextField(
          )
        )
        ],
        )
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



