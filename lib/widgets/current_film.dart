import 'package:flutter/material.dart';
import 'package:movie_match_splash_screen/data/data.dart';
import 'package:movie_match_splash_screen/models/models.dart';
import 'package:movie_match_splash_screen/screens/screens.dart';

class CurrentFilm extends StatefulWidget {
  @override
  _CurrentFilmState createState() => _CurrentFilmState();
}

class _CurrentFilmState extends State<CurrentFilm> {
  final currentFilm = <Film>[];
  final isCurrentComment = <bool>[];
  Future<List<Film>> watchedFilm() async {
    currentFilm.clear();
    isCurrentComment.clear();
    for (Film f in listFilm) {
      for (var i = 0; i < f.user.length; i++) {
        if (currentUser.user_id == f.user[i].user_id) {
          currentFilm.add(f);
        }
      }
    }

    return currentFilm;
  }

  _displayFilm(context, index, List<Film> films) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(film: films[index]))),
          child: Container(
            margin: const EdgeInsets.all(5.0),
            width: 100.0,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.5),
                  blurRadius: 5.0,
                  offset: Offset(5.0, 5.0),
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Hero(
                tag: films[index].film_imgUrl,
                child: Image.asset(
                  films[index].film_imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 0.0,
            child: Row(
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                    Text(
                      '${films[index].user.length}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 5.0),
                Column(
                  children: [
                    Icon(
                      Icons.comment,
                      color: (() {
                        for (var i = 0; i < films[index].comment.length; i++) {
                          if (films[index].comment[i].user.user_id ==
                              currentUser.user_id) {
                            return Colors.blue;
                          }
                        }
                        return Colors.white;
                      }()),
                    ),
                    Text(
                      '${films[index].comment.length}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ))
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'İzlediklerin',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  color: Colors.blue,
                  icon: Icon(Icons.more_vert),
                  onPressed: () => print('more'),
                ),
              ],
            ),
          ),
          Divider(height: 10.0, thickness: .5, color: Colors.white),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              child: FutureBuilder<List<Film>>(
                future: watchedFilm(),
                builder: (context, consrtraint) {
                  if (consrtraint.hasData) {
                    var films = consrtraint.data;
                    print(films.length);
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: films.length,
                      itemBuilder: (context, index) =>
                          _displayFilm(context, index, films),
                    );
                  } else {
                    return Container(
                      margin: EdgeInsets.all(5.0),
                      height: double.infinity,
                      width: 100.0,
                      color: Colors.blue,
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
