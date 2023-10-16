import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie-model.dart';
import 'package:intl/intl.dart';


import 'package:readmore/readmore.dart';

class DetailScreen extends StatefulWidget {
  final MovieModel movie;
  const DetailScreen({super.key,
    required this.movie,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {


  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height*.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.movie.imageUrlOriginal??""
                    ),
                    fit: BoxFit.cover,
                  ),
                ),

                child: Stack(
                  children: [
                    Positioned(
                      top: 30,
                        left: 30,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 35),
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                        )
                    ),
                    Center(
                        child: InkWell(
                          onTap: (){},
                          child: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: const BoxDecoration(
                              color: Color(0x50ffffff),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(Icons.play_arrow,size: 40,color: Color(0x73ffffff))
                            ),
                      ),
                        ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.movie.name??"",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 30,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                const Icon(Icons.access_time,color: Colors.grey,size: 18),
                                Text(" ${widget.movie.runtime} minutes")
                              ],
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            flex: 4,
                            child: Row(
                              children: [
                                const Icon(Icons.star_rate_rounded,color: Colors.grey,size: 22),
                                Text(" ${widget.movie.imdbRating} (IMDb)")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Divider(),

                    Padding(
                      padding :const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex:3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Premiered",
                                  style:  TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                                ),
                                Text( widget.movie.premiered != null ?" ${DateFormat("MMMM dd yyyy").format(DateTime.parse(widget.movie.premiered!))}" : "")
                              ],
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Genre",
                                  style:  TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                    child:Wrap(
                                children: List<Widget>.generate(
                                  widget.movie.genres!.length >2 ? 2 :
                                  widget.movie.genres?.length ??0,
                                      (int idx) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Chip(
                                        elevation: 10,
                                        padding: const EdgeInsets.all(4),
                                        backgroundColor: const Color(0xff252424),
                                        shape: const StadiumBorder(side: BorderSide()),
                                        shadowColor: Colors.black, //CircleAvatar
                                        label: Text(
                                          widget.movie.genres?[idx] ??"",
                                        ), //Text
                                      ),
                                    );
                                  },
                                ).toList(),
                                    ),

                                  // Text(widget.movie.genres.toString()),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Divider(),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Summary",
                            style:TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),

                          ReadMoreText(
                            widget.movie.summary?.replaceAll(RegExp(r'<+[a-zA-Z0-9/]+>'),'') ??"",
                            trimLines: 4,
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            lessStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                            moreStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ]
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
