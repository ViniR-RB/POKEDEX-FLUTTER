import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/commom/models/repositorys/pokemon_repository.dart';
import 'package:pokedex/feactures/pages/routes.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pokedex',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: PokedexRoutes(
          repository: PokemonRepository(dio: Dio()),
        ));
  }
}
