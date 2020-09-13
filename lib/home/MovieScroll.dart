import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../dc/urls.dart';

class MovieScroll extends StatefulWidget {
  @override
  _MovieScrollState createState() => _MovieScrollState();
}

class _MovieScrollState extends State<MovieScroll> {
  List movieList = [];
  @override
  void initState() {
    getMoiveList();
    super.initState();
  }

  void getMoiveList() async {
    try {
      String url = Urls().movieOnInfoList;
      Dio dio = new Dio();
      Response response;
      response = await dio.get(url);
      Map res = jsonDecode(response.toString());
      setState(() {
        movieList = res["movieList"];
      });
    } catch (err) {
      print('$err');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      // ListView.builder数据长度不固定，需要此方法对数据进行遍历
      child: ListView.builder(
        // scrollDirection 遍历出来的每一个组件排列方向-横向
        scrollDirection: Axis.horizontal,
        // itemCount 数组遍历执行的次数
        itemCount: movieList.length,
        // itemBuilder 每一次数组遍历所执行的函数，这个函数的返回值是一个组件/控件/Widget
        // context 上下文，系统默认需要传入；index当前索引
        itemBuilder: (BuildContext context, int index) {
          return ScrollItem(item: movieList[index]);
        },
      ),
    );
  }
}

class ScrollItem extends StatefulWidget {
  ScrollItem({Key key, this.item}) : super(key: key);
  final Map item;
  @override
  _ScrollItemState createState() => _ScrollItemState();
}

class _ScrollItemState extends State<ScrollItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5),
      width: 132.5,
      // Column 从上到下排列组件
      child: Column(
        children: <Widget>[
          // 图片
          Container(
            child: Image(
              width: 127.5,
              height: 178.5,
              image: NetworkImage(
                  (widget.item["img"]).replaceAll('w.h', '170.230')),
              fit: BoxFit.cover,
            ),
            // Text(widget.item["nm"]),
            // Text(widget.item["rt"]),,
          ),
          //电影名字
          Text(
            widget.item["nm"],
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          // 描述信息
          Text(
            '${widget.item["star"]},${widget.item["showInfo"]},评分：${widget.item["sc"]}',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
