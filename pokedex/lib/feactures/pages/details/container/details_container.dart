import 'package:flutter/material.dart';
import 'package:pokedex/commom/widgets/error.dart';
import 'package:pokedex/feactures/pages/details/container/pages/details_page.dart';

import '../../../../commom/erros/failure.dart';
import '../../../../commom/models/pokemon.dart';
import '../../../../commom/models/repositorys/pokemon_repository.dart';
import '../../../../commom/widgets/loading.dart';

class DetailsArguments {
  DetailsArguments({required this.name});
  final String name;
}

class DetailContainer extends StatelessWidget {
  const DetailContainer(
      {Key? key, required this.repository, required this.arguments})
      : super(key: key);
  final IPokemonRepository repository;
  final DetailsArguments arguments;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPOkemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return DetailsPage(name: arguments.name);
          }
          if (snapshot.hasError) {
            return ErrorPage((snapshot.error as Failure).message!);
          }
          return Container();
        });
  }
}

class DetailPage {}
