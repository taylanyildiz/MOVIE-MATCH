import 'package:flutter/material.dart';
import 'package:movie_match_splash_screen/data/data.dart';
import 'package:movie_match_splash_screen/models/models.dart';
import 'package:movie_match_splash_screen/widgets/widgets.dart';

class CommentConnection extends StatelessWidget {
  final Film film;

  const CommentConnection({
    Key key,
    @required this.film,
  }) : super(key: key);

  Future<List<Comment>> commentUser() async {
    final user = <Comment>[];
    user.clear();
    for (var i = 0; i < currentUser.connection.length; i++) {
      for (Comment c in film.comment) {
        if (currentUser.connection[i].user_id == c.user.user_id) {
          user.add(c);
        }
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 220.0,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                width: 120.0,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.red,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    film.film_imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                child: CircleButton(
                  onPressed: () => print('all comment'),
                  icon: Icons.comment,
                  iconSize: 25.0,
                  backgroundColor: Colors.black,
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              //color: Colors.red,
              child: FutureBuilder<List<Comment>>(
                future: commentUser(),
                builder: (context, constraint) {
                  if (constraint.hasData) {
                    List<Comment> user = constraint.data;
                    return ListView.builder(
                      //padding: EdgeInsets.symmetric(vertical: 5.0),
                      scrollDirection: Axis.vertical,
                      itemCount: user.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 3.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleProfile(
                                    padding: 0.0,
                                    fontSize: 20.0,
                                    isColumn: false,
                                    radius: 10.0,
                                    user: user[index].user,
                                    onPressed: () => print('user'),
                                  ),
                                  SizedBox(width: 5.0),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        '${user[index].user.user_name}: ${user[index].comment_text}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                        ),
                                        overflow: TextOverflow.clip,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    user[index].comment_time,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.linked_camera,
                                        color: Colors.red,
                                        size: 15.0,
                                      ),
                                      Text(
                                        '25',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.comment,
                                        color: Colors.red,
                                        size: 15.0,
                                      ),
                                      Text(
                                        '25',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Container(color: Colors.blue);
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
