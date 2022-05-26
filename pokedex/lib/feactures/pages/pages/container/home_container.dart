import 'package:flutter/material.dart';
import 'package:pokedex/commom/erros/failure.dart';
import 'package:pokedex/commom/models/repositorys/pokemon_repository.dart';

import '../../../../commom/models/pokemon.dart';
import '../../details/container/details_container.dart';
import '../home_error.dart';
import '../home_loading.dart';
import '../home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key? key,
    required this.repository,
    required this.Ontap,
  }) : super(key: key);
  final IPokemonRepository repository;
  // ignore: non_constant_identifier_names
  final Function(String, DetailsArguments) Ontap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPOkemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const HomeLoading();
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return HomePage(
              list: snapshot.data!,
              Ontap: Ontap,
            );
          }
          if (snapshot.hasError) {
            return HomeError(error: (snapshot.error as Failure).message!);
          }
          return Container();
        });
  }
}
