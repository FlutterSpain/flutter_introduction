import 'package:flutter/material.dart';
import 'package:flutter_introduction/core/models/character.dart';
import 'package:flutter_introduction/core/services/rick_and_morty_service.dart';
import 'package:flutter_introduction/ui/details/details.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'THE RICK AND MORTY APP',
        ),
      ),
      body: FutureBuilder(
        future: RickAndMortyService.getCharacters(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Character>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                print(index);
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return DetailsPage(character: snapshot.data[index]);
                        },
                      ),
                    );
                  },
                  leading: Image(
                    image: NetworkImage(snapshot.data[index].image),
                  ),
                  title: Text(snapshot.data[index].name),
                  subtitle: Text(snapshot.data[index].origin.name),
                  contentPadding: EdgeInsets.all(8.0),
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
