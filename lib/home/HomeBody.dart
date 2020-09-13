import 'package:flutter/material.dart';
import 'MovieScroll.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // ListView排列不考虑溢出，Column在一个盒子上下放元素，考虑溢出
      child: ListView(
        children: <Widget>[
          HomeBodyArea(title: '最新电影'),
          HomeBodyArea(title: '动漫'),
          HomeBodyArea(title: '喜剧电影'),
        ],
      ),
    );
  }
}

// 四个区块 拆分为组建
class HomeBodyArea extends StatelessWidget {
  HomeBodyArea({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8),
      // Column纵向排列 Row横向排列
      // mainAxisAlignment: , // 主轴
      // crossAxisAlignment: , // 副轴
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  // 插值表达式 只有一个变量 不需要大括号
                  '$title',
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.5,
                  ),
                ),
                Text(
                  '更多>>',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          // 电影无缝滚动区域
          MovieScroll(),
        ],
      ),
    );
  }
}
