import 'package:flutter/material.dart';
import 'package:movie_match_splash_screen/models/models.dart';

class DetailScreen extends StatelessWidget {
  final Film film;

  const DetailScreen({
    Key key,
    this.film,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF201D1D),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5.0,
                          offset: Offset(0.0, 5.0),
                        )
                      ]),
                  child: Hero(
                    tag: film.film_imgUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      child: Image.asset(
                        film.film_imgUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => print(''),
                            icon: Icon(
                              Icons.info,
                              size: 30.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        film.film_name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: [
                          Icon(
                            Icons.movie_creation_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            film.film_director,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            _UserEventWidget(film: film),
            SizedBox(height: 10.0),
            Expanded(
              child: Container(
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _UserEventWidget extends StatelessWidget {
  final Film film;

  const _UserEventWidget({
    Key key,
    @required this.film,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(
                Icons.linked_camera,
                size: 30.0,
                color: Colors.red,
              ),
              Text(
                '0',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.comment,
                size: 30.0,
                color: Colors.red,
              ),
              Text(
                '${film.comment.length}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                ),
              )
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.play_arrow,
                size: 30.0,
                color: Colors.red,
              ),
              Text(
                '${film.user.length}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
