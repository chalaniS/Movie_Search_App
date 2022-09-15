import 'package:flutter/material.dart';
import 'package:search_system_app/model/movie_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<MovieModel> main_movies_list = [
    MovieModel("Inception ", 2000, 9.3,
        "https://stat2.bollywoodhungama.in/wp-content/uploads/2017/11/Jumanji-Welcome-to-The-Jungle-English-01-306x393.jpg"),
    MovieModel("The prince ", 1800, 9.3,
        "https://stat2.bollywoodhungama.in/wp-content/uploads/2017/11/Jumanji-Welcome-to-The-Jungle-English-01-306x393.jpg"),
    MovieModel("Call ", 1994, 9.3,
        "https://stat2.bollywoodhungama.in/wp-content/uploads/2017/11/Jumanji-Welcome-to-The-Jungle-English-01-306x393.jpg"),
    MovieModel("Banana ", 1994, 9.3,
        "https://stat2.bollywoodhungama.in/wp-content/uploads/2017/11/Jumanji-Welcome-to-The-Jungle-English-01-306x393.jpg"),
    MovieModel("Cool ", 1994, 9.3,
        "https://stat2.bollywoodhungama.in/wp-content/uploads/2017/11/Jumanji-Welcome-to-The-Jungle-English-01-306x393.jpg"),
    MovieModel("Heart ", 1994, 9.3,
        "https://stat2.bollywoodhungama.in/wp-content/uploads/2017/11/Jumanji-Welcome-to-The-Jungle-English-01-306x393.jpg"),
    MovieModel("Humans ", 1600, 9.3,
        "https://stat2.bollywoodhungama.in/wp-content/uploads/2017/11/Jumanji-Welcome-to-The-Jungle-English-01-306x393.jpg"),
    MovieModel("Girl ", 1690, 9.3,
        "https://stat2.bollywoodhungama.in/wp-content/uploads/2017/11/Jumanji-Welcome-to-The-Jungle-English-01-306x393.jpg"),
  ];

  List<MovieModel> display_list = List.from(main_movies_list);

  void updateList(String value) {
    setState(() {
      display_list = main_movies_list
          .where((element) =>
              element.movie_title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1f1545),
      appBar: AppBar(
        title: const Text(
          "MovieHub",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1f1545),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Search for a Movie",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              autofocus: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xff302360),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg: The Dark Knight",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.purple.shade900,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: display_list.isEmpty
                  ? const Center(
                      child: Text(
                        "Search Results is not found",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: display_list.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: const EdgeInsets.all(8.0),
                        title: Text(
                          display_list[index].movie_title!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${display_list[index].movie_release_year}',
                          style: const TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                        trailing: Text(
                          "${display_list[index].rating}",
                          style: const TextStyle(
                            color: Colors.amber,
                          ),
                        ),
                        leading: Image.network(
                          display_list[index].movie_poster_url!,
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
