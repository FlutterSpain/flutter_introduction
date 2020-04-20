import 'package:flutter/material.dart';

import 'package:flutter_introduction/core/models/character.dart';

class DetailsPage extends StatelessWidget {
  final Character character;

  const DetailsPage({Key key, this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character == null ? '' : character.name),
      ),
      body: character == null
          ? Center(
              child: Text(
                'Select a character',
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image(
                    image: NetworkImage(character.image),
                    height: 300,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  _getTitle(context, 'Name'),
                  _getText(context, character.name),
                  _getTitle(context, 'Status'),
                  _getText(context, character.status),
                  _getTitle(context, 'Species'),
                  _getText(context, character.species),
                  _getTitle(context, 'Gender'),
                  _getText(context, character.gender),
                  _getTitle(context, 'Origin'),
                  _getText(context, character.location.name),
                ],
              ),
            ),
    );
  }

  Widget _getTitle(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(color: Colors.green, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _getText(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
