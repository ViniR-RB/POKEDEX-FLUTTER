import 'dart:convert';

import 'package:pokedex/commom/erros/failure.dart';

import '../consts/api_consts.dart';
import '../pokemon.dart';
import 'package:dio/dio.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPOkemons();
}

class PokemonRepository implements IPokemonRepository {
  final Dio dio;
  PokemonRepository({required this.dio});

  @override
  Future<List<Pokemon>> getAllPOkemons() async {
    try {
      final response = await dio.get(ApiConsts.allPokemonsURL);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Failure(
        message: 'Não foi Possível carregar os dados',
      );
    }
  }
}
