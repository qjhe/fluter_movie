import 'package:flutter/material.dart';
import 'HomeBody.dart';
import '../movie/MovieList.dart';
import '../cinema/CinemaList.dart';
import '../detail/Detail.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // 控制器控制页面切换的数量，与导航的数量一致
      length: 3,
      child: Scaffold(
        // 顶部导航
        appBar: AppBar(
          title: Text('$title'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => {},
            )
          ],
        ),

        // 侧边栏
        drawer: Drawer(
          // ListView从上到下排列的盒子容器 也可以从左到右排
          child: ListView(
            // 去掉顶部padding
            padding: EdgeInsets.all(0),
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('浪人'),
                accountEmail: Text('321556587@qq.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'http://qd.gaotue.cn/upload/202005/28/202005281727299469.jpg'),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'http://qd.gaotue.cn/upload/202005/28/202005281732590387.jpg'))),
              ),
              ListTile(
                title: Text('我的发布'),
                trailing: Icon(Icons.send),
              ),
              ListTile(
                title: Text('我的收藏'),
                trailing: Icon(Icons.feedback),
              ),
              ListTile(
                title: Text('系统设置'),
                trailing: Icon(Icons.settings),
              ),
              Divider(
                color: Colors.black45,
              ),
              ListTile(
                title: Text('注销'),
                trailing: Icon(Icons.exit_to_app),
              )
            ],
          ),
        ),

        // 页面需要传TabBarView实现导航联动
        body: TabBarView(children: <Widget>[
          HomeBody(),
          MovieList(),
          CinemaList(),
        ]),

        // 底部导航
        bottomNavigationBar: Container(
          height: 50,
          decoration: BoxDecoration(color: Colors.black),
          child: TabBar(
              labelStyle: TextStyle(
                height: 0,
                fontSize: 11,
              ),
              tabs: <Widget>[
                Tab(text: '首页', icon: Icon(Icons.home)),
                Tab(text: '正在热映', icon: Icon(Icons.movie_filter)),
                Tab(text: '影院信息', icon: Icon(Icons.local_movies)),
              ]),
        ),
      ),
    );
  }
}
