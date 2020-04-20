import 'package:flutter/material.dart';

import 'package:flutter_introduction/core/models/character.dart';
import 'package:flutter_introduction/core/services/rick_and_morty_service.dart';
import 'package:flutter_introduction/ui/list/list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: RickAndMortyService.getCharacters(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Character>> snapshot) {
          if (snapshot.hasData) {
            return ListPage(
              characters: snapshot.data,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
