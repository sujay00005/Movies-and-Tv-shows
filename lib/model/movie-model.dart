class MovieModel{
  String? name;
  String? imageUrlMedium;
  String? imageUrlOriginal;
  int? runtime;
  double? imdbRating;
  // var now = DateTime.now();
  // DateFormat.yMMMMd().format(now)
  String? premiered;
  List<String>? genres;
  String? summary;


  MovieModel({
    this.name,
    this.imageUrlMedium,
    this.imageUrlOriginal,
    this.runtime,
    this.imdbRating,
    this.premiered,
    this.genres,
    this.summary,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json){
    print("⏺️ ${json['name']}");
    return MovieModel(
        name: json['name'] != null ? json['name']: null,
        imageUrlMedium: json['image'] != null && json['image']['medium'] != null
            ? json['image']['medium']: null,
        imageUrlOriginal: json['image'] != null && json['image']['original'] != null
            ? json['image']['original'] : null,
        runtime: json['runtime'] !=null ? json['runtime'].toInt():null,
        imdbRating: json['rating'] != null && json['rating']['average'] != null
            ? json['rating']['average'].toDouble() : null,
        premiered: json['premiered'] !=null ?json['premiered']:null,
        genres:json['genres'] !=null ? json['genres'].cast<String>(): null,
        summary: json['summary'] !=null ? json['summary'] : null,
    );
  }
}











// {
// "id": 32686,
// "url": "https://www.tvmaze.com/shows/32686/spider-man",
// "name": "Spider-Man",
// "type": "Animation",
// "language": "English",
// "genres": [
// "Action",
// "Adventure",
// "Science-Fiction"
// ],
// "status": "Ended",
// "runtime": 22,
// "averageRuntime": 22,
// "premiered": "1981-09-12",
// "ended": "1982-03-06",
// "rating": {
// "average": null
// },
// "image": {
// "medium": "https://static.tvmaze.com/uploads/images/medium_portrait/131/328110.jpg",
// "original": "https://static.tvmaze.com/uploads/images/original_untouched/131/328110.jpg"
// },
// "summary": "<p>The web slinging superhero battles crime in New York City.</p>",
// }