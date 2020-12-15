import 'package:catalogue_movie/entity/movie.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MovieDetail extends StatelessWidget{
  Color mainColor = const Color(0xff3C3261);

  final Movie movie;
  MovieDetail({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(movie.poster, fit: BoxFit.cover,),
            BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
                      Navigator.pop(context);
                    }),
                    Hero(
                      tag: 'tagPoster${movie.id}',
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                        alignment: Alignment.center,
                        child: Container(
                          width: 380.0,
                          height: 380.0,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(image: NetworkImage(movie.poster), fit: BoxFit.cover
                            ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 18.0,
                            offset: Offset(0.0, 10.0)
                          )]
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 0.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text(movie.title,style: TextStyle(color: Colors.white,fontSize: 30.0,),)),
                          Text('${movie.rating}/10',style: TextStyle(color: Colors.white,fontSize: 20.0,),)
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Icon(Icons.access_time),
                              SizedBox(height: 8.0),
                              Text(movie.runtime),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Icon(Icons.people),
                              SizedBox(height: 8.0),
                              Text(movie.people),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Icon(Icons.language),
                              SizedBox(height: 8.0),
                              Text(movie.language),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Icon(Icons.calendar_today),
                              SizedBox(height: 8.0),
                              Text(movie.release_date),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Icon(Icons.monetization_on),
                              SizedBox(height: 8.0),
                              Text(movie.budget),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(10.0)),
                    Text(movie.overview,style: new TextStyle(color: Colors.white)),
                    Padding(padding: const EdgeInsets.all(10.0)),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                              width: 150.0,
                              height: 60.0,
                              alignment: Alignment.center,
                              child: Text('Rate Movie',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: const Color(0xaa3C3261)
                              ),
                            )
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            child: Icon(Icons.share,color: Colors.white,),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color(0xaa3C3261)
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              alignment: Alignment.center,
                              child: FavoriteButton(),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: const Color(0xaa3C3261)
                              ),
                            )
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }}

  class FavoriteButton extends StatefulWidget{
  @override
      _FavoriteButtonState createState() => _FavoriteButtonState();
  }

  class _FavoriteButtonState extends State<FavoriteButton> {
    bool isFavorite = false;
    @override
    Widget build(BuildContext context) {
      return IconButton(
        icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,color: Colors.pink),
        onPressed: (){
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      );
    }
  }