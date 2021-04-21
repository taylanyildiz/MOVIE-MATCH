import 'package:flutter/material.dart';
import 'package:movie_match_splash_screen/models/models.dart';

enum LikeType {
  comment,
  film,
}

class Like {
  final int like_id;
  final bool like_active;
  final LikeType like_type;
  final String like_time;
  final User user;

  Like({
    @required this.like_id,
    @required this.like_active,
    @required this.like_type,
    @required this.like_time,
    @required this.user,
  });
}
