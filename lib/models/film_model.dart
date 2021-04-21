import 'package:flutter/material.dart';
import 'package:movie_match_splash_screen/models/models.dart';

class Film {
  final int film_id;
  final String film_name;
  final String film_imgUrl;
  final String film_about;
  final String film_director;
  final String film_cast;
  final List<User> user; //Watched USER
  final List<Comment> comment;
  Film({
    @required this.film_id,
    @required this.film_name,
    @required this.film_imgUrl,
    @required this.film_about,
    @required this.film_director,
    @required this.film_cast,
    this.user,
    this.comment,
  });
}
