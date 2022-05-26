import 'package:flutter/material.dart';
import 'package:pokedex/commom/models/repositorys/pokemon_repository.dart';
import 'package:pokedex/feactures/pages/details/container/details_container.dart';
import 'package:pokedex/feactures/pages/pages/container/home_container.dart';

class PokedexRoutes extends StatelessWidget {
  final PokemonRepository repository;
  const PokedexRoutes({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) {
            return HomeContainer(
              repository: repository,
              Ontap: (route, arguments) {
                Navigator.of(context).pushNamed(route, arguments: arguments);
              },
            );
          });
        }
        if (settings.name == '/details') {
          return MaterialPageRoute(builder: (context) {
            return DetailContainer(
              repository: repository,
              arguments: (settings.arguments as DetailsArguments),
            );
          });
        }
      },
    );
  }
}
