import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:movie_match_splash_screen/data/data.dart';
import 'package:movie_match_splash_screen/models/models.dart';
import 'package:movie_match_splash_screen/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({
    Key key,
    this.title,
  }) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isSearch = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 120.0,
          toolbarHeight: 120.0,
          elevation: 0.0,
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          actions: [
            CircleProfile(
              user: currentUser,
              onPressed: () => print('current user'),
            ),
          ],
          leading: Row(
            children: [
              CircleButton(
                icon: Icons.search,
                onPressed: () => print('search'),
                iconSize: 15.0,
              ),
              CircleButton(
                icon: Icons.share,
                onPressed: () => print('share'),
                iconSize: 15.0,
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xFF201D1D),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(10.0),
              sliver: SliverToBoxAdapter(
                child: LiveUsers(),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 10.0),
              sliver: SliverToBoxAdapter(
                child: CurrentFilm(),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 10.0),
              sliver: SliverToBoxAdapter(
                child: ConnectionFilm(),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  var films = HashSet<Film>();
                  final filmComment = HashSet<Film>();
                  filmComment.clear();
                  films.clear();
                  for (var i = 0; i < currentUser.connection.length; i++) {
                    for (Film f in listFilm) {
                      for (var j = 0; j < f.user.length; j++) {
                        if (f.user[j].user_id ==
                            currentUser.connection[i].user_id) {
                          films.add(f);
                        }
                      }
                    }
                  }
                  for (var i = 0; i < currentUser.connection.length; i++) {
                    for (Film f in films) {
                      for (var j = 0; j < f.comment.length; j++) {
                        if (f.comment[j].user.user_id ==
                            currentUser.connection[i].user_id) {
                          filmComment.add(f);
                        }
                      }
                    }
                  }

                  return CommentConnection(film: filmComment.elementAt(index));
                },
                childCount: (() {
                  var films = HashSet<Film>();
                  final filmComment = HashSet<Film>();
                  filmComment.clear();
                  films.clear();
                  for (var i = 0; i < currentUser.connection.length; i++) {
                    for (Film f in listFilm) {
                      for (var j = 0; j < f.user.length; j++) {
                        if (f.user[j].user_id ==
                            currentUser.connection[i].user_id) {
                          films.add(f);
                        }
                      }
                    }
                  }
                  for (var i = 0; i < currentUser.connection.length; i++) {
                    for (Film f in films) {
                      for (var j = 0; j < f.comment.length; j++) {
                        if (f.comment[j].user.user_id ==
                            currentUser.connection[i].user_id) {
                          filmComment.add(f);
                        }
                      }
                    }
                  }
                  return filmComment.length;
                }()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
