import 'package:flutter/material.dart';
import 'package:movie_app/controller/movie-controller.dart';
import 'package:movie_app/model/movie-model.dart';

import '../component/movie-card.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int _selectedIndex = 1;
  List<MovieModel> movie =[];
  @override
  Widget build(BuildContext context) {
    movie = [];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
                toolbarHeight: 120,
                title: const Text('Find Movies, Tv series, and more...',
                  maxLines: 2,
                  softWrap: true,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 32,
                  ),
                ),
        ),


        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FutureBuilder(
            future: MovieController().getMovies(),
            builder: (BuildContext context, AsyncSnapshot<List<MovieModel>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done && !snapshot.hasData) {
                  return const Center(
                    child: SizedBox(
                      child: Text('Error while fetching data'),
                    ),
                  );
                }
                else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                  movie = snapshot.data!;

                  return GridView.builder(
                    itemCount: 5,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.6,
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,

                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return MovieCard(movie: movie[index]);
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
          ),
        ),


        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,size: 40),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.play_circle,size: 40),
              label: 'Video',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle,size: 40),
              label: 'Account',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xffea9b68),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}


