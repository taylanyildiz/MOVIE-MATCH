import 'package:flutter/material.dart';

class User {
  final int user_id;
  final String user_realname;
  final String user_name;
  final String user_bio;
  final String user_mail;
  final String user_birthdate;
  final String user_photo_1;
  final String user_photo_2;
  final String user_photo_3;
  final List<User> connection;
  User({
    @required this.user_id,
    @required this.user_realname,
    @required this.user_name,
    @required this.user_bio,
    @required this.user_mail,
    @required this.user_birthdate,
    @required this.user_photo_1,
    @required this.user_photo_2,
    @required this.user_photo_3,
    this.connection,
  });
}
