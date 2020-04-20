import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_introduction/core/models/character.dart';

class RickAndMortyService {
  static Future<List<Character>> getCharacters() async {
    List<Character> characters = [];
    var response = await http.get('https://rickandmortyapi.com/api/character/');

    json.decode(response.body)['results'].forEach((result) {
      characters.add(Character.fromMap(result));
    });

    return characters;
  }
}
