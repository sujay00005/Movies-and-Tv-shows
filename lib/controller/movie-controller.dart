import 'dart:convert';

import 'package:movie_app/model/movie-model.dart';
import 'package:http/http.dart' as http;

class MovieController{
  Future<List<MovieModel>> getMovies() async{
    var response = await http.get(
      Uri.parse( "https://api.tvmaze.com/search/shows?q=spiderman"),
    );
    final jsonResponse = jsonDecode(response.body) as List;
    List<MovieModel> movieList = [];

    for(final data in jsonResponse) {
      final movie = MovieModel.fromJson(data['show']);
      movieList.add(movie);
    }

    return movieList;
  }
}