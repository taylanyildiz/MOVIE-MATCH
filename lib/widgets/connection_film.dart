import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:movie_match_splash_screen/data/data.dart';
import 'package:movie_match_splash_screen/models/models.dart';
import 'package:movie_match_splash_screen/screens/screens.dart';

class ConnectionFilm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: Column(
        children: [
          _HeadWidget(),
          Divider(height: 10.0, thickness: .5, color: Colors.white),
          _ConnectionFilms(),
        ],
      ),
    );
  }
}

/// Head
class _HeadWidget extends StatefulWidget {
  @override
  __HeadWidgetState createState() => __HeadWidgetState();
}

class __HeadWidgetState extends State<_HeadWidget> {
  var isSearch = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          !isSearch
              ? Text(
                  'Arkadaşlarının izledikleri',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Expanded(
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration.collapsed(
                      hintText: 'Film veya arkadaşını ara',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
          IconButton(
            color: Colors.blue,
            icon: Icon(isSearch ? Icons.search_off : Icons.search),
            onPressed: () => setState(() => isSearch = !isSearch),
          ),
        ],
      ),
    );
  }
}

/// Film Display
class _ConnectionFilms extends StatefulWidget {
  _ConnectionFilms({Key key}) : super(key: key);
  @override
  __ConnectionFilmsState createState() => __ConnectionFilmsState();
}

class __ConnectionFilmsState extends State<_ConnectionFilms> {
  PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 3, viewportFraction: 0.3);
  }

  Future<HashSet<Film>> connectionFilm() async {
    var films = HashSet<Film>();
    currentUser.connection.clear();
    films.clear();
    await addConnection(listUser[6]); //Can
    await addConnection(listUser[2]); //Barış
    await addConnection(listUser[1]); //Yağmur
    for (var i = 0; i < currentUser.connection.length; i++) {
      for (Film f in listFilm) {
        for (var j = 0; j < f.user.length; j++) {
          if (f.user[j].user_id == currentUser.connection[i].user_id) {
            films.add(f);
          }
        }
      }
    }
    return films;
  }

  Future addConnection(User user) async {
    currentUser.connection.add(user);
  }

  Widget pageViewWidget(context, index, film) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        var value = 1.0;
        if (_pageController.position.hasContentDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.25)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            width: Curves.easeInOut.transform(value) * 120.0,
            height: Curves.easeInOut.transform(value) * 200.0,
            child: child,
          ),
        );
      },
      child: _displayConnectionFilms(context, index, film),
    );
  }

  _onPageChanged(page) {
    setState(() {
      currentPage = page;
    });
  }

  Widget _displayConnectionFilms(context, index, Set<Film> films) {
    return GestureDetector(
      onTap: () => currentPage == index
          ? Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(
                        film: films.elementAt(index),
                      )))
          : print('${index}'),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              margin: EdgeInsets.all(3.0),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: currentPage == index
                    ? Border.all(width: 5.0, color: Colors.red)
                    : null,
              ),
              child: Image.asset(
                films.elementAt(index).film_imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          currentPage == index
              ? Positioned(
                  top: 0.0,
                  child: Text(
                    films.elementAt(index).film_name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                )
              : SizedBox.shrink(),
          currentPage == index
              ? Positioned(
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
                            '${films.elementAt(index).user.length}',
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
                            color: Colors.white,
                          ),
                          Text(
                            '${films.elementAt(index).comment.length}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: FutureBuilder<Set<Film>>(
          future: connectionFilm(),
          builder: (context, constraint) {
            if (constraint.hasData) {
              final film = constraint.data;
              return PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (page) => _onPageChanged(page),
                itemCount: film.length,
                itemBuilder: (context, index) =>
                    pageViewWidget(context, index, film),
              );
            } else {
              return Container(
                margin: const EdgeInsets.all(5.0),
                color: Colors.white,
                child: Center(child: Text('Error')),
              );
            }
          },
        ),
      ),
    );
  }
}
