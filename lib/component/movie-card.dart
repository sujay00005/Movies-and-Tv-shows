import 'package:flutter/material.dart';

import '../model/movie-model.dart';
import '../view/detail-screen.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailScreen(movie: movie)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: SizedBox(
                child: Image.network(
                  movie.imageUrlMedium??"",
                  height: size.height/3.5,
                  width: size.width/2-20,
                  fit: BoxFit.cover,

                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 0,bottom: 10),
            child: Row(
              children: [
                Text(movie.name ??"",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
            Text(movie.premiered != null ?" (${movie.premiered?.substring(0,4)})":"",
              style: const TextStyle(
              color: Colors.white70
            ),),
              ],
            ),
          )
        ],
      ),
    );
  }
}