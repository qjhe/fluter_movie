import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../dc/urls.dart';

class CinemaList extends StatefulWidget {
  @override
  _CinemaListState createState() => _CinemaListState();
}

class _CinemaListState extends State<CinemaList> {
  List demoData = [
    {
      "id": 55,
      "mark": 0,
      "nm": "IDA传奇影城（怀柔店）",
      "sellPrice": "23",
      "addr": "怀柔区青春路15号四层",
      "distance": "224.1km",
      "tag": {
        "allowRefund": 1,
        "buyout": 0,
        "cityCardTag": 0,
        "deal": 0,
        "endorse": 1,
        "giftTag": "",
        "hallType": [],
        "hallTypeVOList": [],
        "sell": 1,
        "snack": 1,
        "vipTag": "折扣卡"
      },
      "promotion": {
        "cardPromotionTag": "开卡特惠，首单1张最高立减2元",
        "couponPromotionTag": "",
        "merchantActivityTag": "",
        "packShowActivityTag": "",
        "platformActivityTag": "",
        "starActivityTag": ""
      },
      "showTimes": ""
    },
    {
      "id": 24260,
      "mark": 0,
      "nm": "唐阁影城（怀柔星东天地店免费停车）",
      "sellPrice": "23",
      "addr": "怀柔区开放东路13号院2号楼",
      "distance": "225.7km",
      "tag": {
        "allowRefund": 1,
        "buyout": 0,
        "cityCardTag": 0,
        "deal": 0,
        "endorse": 1,
        "giftTag": "",
        "hallType": [],
        "hallTypeVOList": [],
        "sell": 1,
        "snack": 1,
        "vipTag": "折扣卡"
      },
      "promotion": {
        "cardPromotionTag": "开卡特惠，首单1张最高立减4元",
        "couponPromotionTag": "",
        "merchantActivityTag": "",
        "packShowActivityTag": "",
        "platformActivityTag": "",
        "starActivityTag": ""
      },
      "showTimes": ""
    },
    {
      "id": 26958,
      "mark": 0,
      "nm": "观华全色彩激光影城（盒马鲜生店）",
      "sellPrice": "23.8",
      "addr": "朝阳区十里堡新城市广场负一层观华国际影城",
      "distance": "183.9km",
      "tag": {
        "allowRefund": 1,
        "buyout": 0,
        "cityCardTag": 0,
        "deal": 0,
        "endorse": 1,
        "giftTag": "",
        "hallType": ["儿童厅", "4K厅"],
        "hallTypeVOList": [
          {"name": "儿童厅", "url": ""},
          {"name": "4K厅", "url": ""}
        ],
        "sell": 1,
        "snack": 1,
        "vipTag": ""
      },
      "promotion": {
        "cardPromotionTag": "",
        "couponPromotionTag": "",
        "merchantActivityTag": "",
        "packShowActivityTag": "",
        "platformActivityTag": "",
        "starActivityTag": ""
      },
      "showTimes": ""
    },
    {
      "id": 27622,
      "mark": 0,
      "nm": "泰禾影城（马家堡店）",
      "sellPrice": "23.9",
      "addr": "丰台区角门19号新荟城购物中心4层泰禾影城马家堡店",
      "distance": "170km",
      "tag": {
        "allowRefund": 0,
        "buyout": 0,
        "cityCardTag": 0,
        "deal": 0,
        "endorse": 1,
        "giftTag": "",
        "hallType": [],
        "hallTypeVOList": [],
        "sell": 1,
        "snack": 0,
        "vipTag": "折扣卡"
      },
      "promotion": {
        "cardPromotionTag": "开卡特惠，首单1张最高立减2元",
        "couponPromotionTag": "",
        "merchantActivityTag": "",
        "packShowActivityTag": "",
        "platformActivityTag": "",
        "starActivityTag": ""
      },
      "showTimes": ""
    },
    {
      "id": 35745,
      "mark": 0,
      "nm": "万画影城 （国投财富广场店）",
      "sellPrice": "23.9",
      "addr": "丰台区广安路9号院11号楼地下一层1217-08",
      "distance": "171.2km",
      "tag": {
        "allowRefund": 1,
        "buyout": 0,
        "cityCardTag": 0,
        "deal": 0,
        "endorse": 1,
        "giftTag": "",
        "hallType": [],
        "hallTypeVOList": [],
        "sell": 1,
        "snack": 0,
        "vipTag": "折扣卡"
      },
      "promotion": {
        "cardPromotionTag": "",
        "couponPromotionTag": "",
        "merchantActivityTag": "",
        "packShowActivityTag": "",
        "platformActivityTag": "",
        "starActivityTag": ""
      },
      "showTimes": ""
    },
    {
      "id": 2548,
      "mark": 0,
      "nm": "华谊兄弟影院（IMAX洋桥店）",
      "sellPrice": "24",
      "addr": "丰台区马家堡东路101号院10号银泰百货6层地铁10号线角门东站D口",
      "distance": "171.1km",
      "tag": {
        "allowRefund": 0,
        "buyout": 0,
        "cityCardTag": 0,
        "deal": 0,
        "endorse": 1,
        "giftTag": "",
        "hallType": ["IMAX厅"],
        "hallTypeVOList": [
          {"name": "IMAX厅", "url": ""}
        ],
        "sell": 1,
        "snack": 0,
        "vipTag": "折扣卡"
      },
      "promotion": {
        "cardPromotionTag": "开卡特惠，首单2张最高立减6元",
        "couponPromotionTag": "",
        "merchantActivityTag": "",
        "packShowActivityTag": "",
        "platformActivityTag": "",
        "starActivityTag": ""
      },
      "showTimes": ""
    }
  ];
  List clist = [];
  @override
  void initState() {
    getCinamaList();
    super.initState();
  }

  void getCinamaList() async {
    try {
      Dio dio = new Dio();
      Response response = await dio.get(Urls().cinemaList);
      Map res = jsonDecode(response.toString());
      print(res);
      setState(() {
        clist = res["cinemas"] ?? demoData;
      });
    } catch (err) {
      print(err);
    }
  }

  // 红色
  Color color0 = Color.fromARGB(255, 240, 61, 55);
  // 橙色
  Color color1 = Color.fromARGB(255, 255, 153, 0);
  // 黄绿色
  Color color2 = Color.fromARGB(255, 88, 157, 175);

  List<Widget> tagWidgets(tag) {
    List<Widget> tagList = [];
    // 退
    if (tag["allowRefund"] == 1) {
      tagList.add(CinemaTag(color: color2, text: '退'));
    }
    // 改
    if (tag["endorse"] == 1) {
      tagList.add(CinemaTag(color: color2, text: '改签'));
    }
    // 小吃
    if (tag["snack"] == 1) {
      tagList.add(CinemaTag(color: color1, text: '小吃'));
    }
    // 折扣
    if (tag["vipTag"] is String && tag["vipTag"].length > 0) {
      tagList.add(CinemaTag(color: color1, text: tag["vipTag"]));
    }
    // 影厅部分
    tag["hallType"].forEach((str) {
      tagList.add(CinemaTag(color: color2, text: str));
    });
    return tagList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: ListView.builder(
        itemCount: clist.length,
        itemBuilder: (BuildContext context, int index) {
          Map clistItem = clist[index];
          return Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.grey),
            )),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '${clistItem["nm"]}',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '${clistItem["sellPrice"]}',
                        style: TextStyle(
                          color: color0,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '元起',
                        style: TextStyle(
                          color: color0,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '${clistItem["addr"]}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Color.fromARGB(255, 102, 102, 102)),
                        ),
                      ),
                      Text(
                        '${clistItem["distance"]}',
                        style: TextStyle(
                            color: Color.fromARGB(255, 102, 102, 102)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Row(
                    children: tagWidgets(clistItem["tag"]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 17,
                        height: 17,
                        margin: EdgeInsets.only(right: 5),
                        child: Image(image: AssetImage('images/card.png')),
                      ),
                      Text(
                        '${clistItem["promotion"]["cardPromotionTag"]}',
                        style: TextStyle(
                            color: Color.fromARGB(255, 133, 133, 133)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CinemaTag extends StatelessWidget {
  CinemaTag({Key key, @required this.color, @required this.text})
      : super(key: key);
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          border: Border.all(
            color: color,
          ),
          borderRadius: BorderRadius.all(Radius.circular(3))),
      padding: EdgeInsets.fromLTRB(2, 0, 2, 1),
      child: Text(
        '$text',
        style: TextStyle(color: color, fontSize: 11),
      ),
    );
  }
}
