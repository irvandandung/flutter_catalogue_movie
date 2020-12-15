import 'package:flutter/material.dart';
import 'package:catalogue_movie/data/movie_data.dart';
import 'package:catalogue_movie/ui/movie_detail.dart';

class MovieList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Catalogue'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
        children: movieData.map((movie){
          return Card(
            semanticContainer: true,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MovieDetail(movie: movie);
                }));
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    Hero(
                      tag: "tagPoster${movie.id}",
                      child: Container(
                        width: 300,
                        height: 240,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(image: NetworkImage(movie.poster), fit: BoxFit.cover
                        ),
                      )),
                    ),
                    Text(movie.title, style: TextStyle(color: Colors.white,fontSize: 20.0,),),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.favorite, color: Colors.pink),
                          Text('${movie.rating}/10',style: new TextStyle(color: Colors.white,fontSize: 18.0,),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList()
      ),
    );
  }
}