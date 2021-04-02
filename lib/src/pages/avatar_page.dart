import 'package:flutter/material.dart';



class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(2.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2016/11/stan-lee.jpg?itok=rj-BqyOg'),
              radius: 20.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only( right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),

      body: Center(
        child: FadeInImage(
          fadeInDuration: Duration(milliseconds: 200),
          placeholder: AssetImage('assets/jar-loading.gif'), 
          image:NetworkImage('https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2016/11/stan-lee.jpg?itok=rj-BqyOg')),
      ),

    );
  }
}