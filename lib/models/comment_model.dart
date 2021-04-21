import 'package:flutter/material.dart';
import 'package:movie_match_splash_screen/models/models.dart';

class Comment {
  final int comment_id;
  final String comment_text;
  final String comment_time;
  final User user;

  Comment({
    @required this.comment_id,
    @required this.comment_text,
    @required this.user,
    @required this.comment_time,
  });
}
