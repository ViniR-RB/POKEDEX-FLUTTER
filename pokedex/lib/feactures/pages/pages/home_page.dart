import 'package:flutter/material.dart';
import 'package:pokedex/feactures/pages/details/container/details_container.dart';

import '../../../commom/models/pokemon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list, required this.Ontap})
      : super(key: key);
  final List<Pokemon> list;
  final Function(String, DetailsArguments) Ontap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () =>
                Ontap('/details', DetailsArguments(name: list[index].name)),
            trailing: Text(list[index].num),
            leading: Image.network(list[index].img),
            title: Text(list[index].name),
          );
        },
      ),
    );
  }
}
