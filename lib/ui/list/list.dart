import 'package:flutter/material.dart';

import 'package:flutter_introduction/core/models/character.dart';
import 'package:flutter_introduction/ui/details/details.dart';

class ListPage extends StatefulWidget {
  final List<Character> characters;

  ListPage({Key key, this.characters}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Character _characterSelected;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: size.width > size.height
            ? Row(
                children: <Widget>[
                  Flexible(flex: 1, child: _getScaffold(size)),
                  Flexible(
                    flex: 1,
                    child: DetailsPage(
                      character: _characterSelected,
                    ),
                  )
                ],
              )
            : _getScaffold(size));
    // return _getList(size);
  }

  Widget _getScaffold(Size size) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty'),
      ),
      body: _getList(size),
    );
  }

  Widget _getList(Size size) {
    return ListView.builder(
      itemCount: widget.characters.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {
            size.width > size.height
                ? setState(() {
                    _characterSelected = widget.characters[index];
                  })
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return DetailsPage(character: widget.characters[index]);
                      },
                    ),
                  );
          },
          leading: Image(
            image: NetworkImage(widget.characters[index].image),
          ),
          title: Text(widget.characters[index].name),
          subtitle: Text(widget.characters[index].origin.name),
          contentPadding: EdgeInsets.all(8.0),
          trailing: Icon(Icons.arrow_forward_ios),
        );
      },
    );
  }
}
