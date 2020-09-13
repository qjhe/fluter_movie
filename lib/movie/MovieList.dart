import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../dc/urls.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List movieList = [];
  @override
  void initState() {
    getMoreMovies();
    super.initState();
  }

  void getMoreMovies() async {
    try {
      String url = Urls().moreMovie;
      Dio dio = new Dio();
      Response response;
      response = await dio.get(url);
      Map res = jsonDecode(response.toString());
      setState(() {
        movieList = res['coming'];
      });
    } catch (err) {
      print('$err');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movieList.length,
      itemBuilder: (BuildContext context, int index) {
        return MovieListItem(item: movieList[index]);
      },
    );
  }
}

class MovieListItem extends StatefulWidget {
  MovieListItem({Key key, @required this.item}) : super(key: key);
  final Map item;

  @override
  _MovieListItemState createState() => _MovieListItemState();
}

class _MovieListItemState extends State<MovieListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Image(
              width: 128,
              height: 179,
              image: NetworkImage(
                  widget.item["img"].replaceAll('w.h', '170.230'))),
          Expanded(
            child: Container(
              height: 160,
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.item["nm"] ?? '无',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text('评分:${widget.item["sc"]}'),
                  Text(
                    '主演:${widget.item["star"]}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text('上映日期:${widget.item["rt"]}'),
                  Text('排期:${widget.item["comingTitle"]}'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
