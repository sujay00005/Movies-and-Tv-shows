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

    double wid = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailScreen(movie: movie)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              movie.imageUrlMedium??"",
              height: 200,
              width: wid/2,
              fit: BoxFit.cover,

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 15),
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