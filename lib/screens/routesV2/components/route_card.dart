import 'dart:async';

import 'package:first_flutter_app/models/routes_model.dart';
import 'package:first_flutter_app/screens/church/body.dart';
import 'package:first_flutter_app/screens/routes_description/routes_description_screen.dart';
import 'package:flutter/material.dart';

import 'route_info_label.dart';


class RouteCard extends StatelessWidget {
  final RouteInfo route;

  const RouteCard({Key key, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(left: 20, right: 10, top: 0, bottom: 0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 210,
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      route.image,
                      height: 100.0,
                      width: 250.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Text(route.title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subtitle),
                Row(
                  children: <Widget>[
                    RouteInfoLabel(route.time),
                    RouteInfoLabel(route.distance),
                    RouteInfoLabel('${route.elevation} \u{2197}'),
                  ],
                )
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
//                splashColor: Colors.lightGreenAccent,
                onTap: () {
                  print("/////////////");

                  Timer(const Duration(milliseconds: 300), () {
                    return Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
//                      return RouteMap();
                        addNewChurch();
                      return RouteDescription(routeInfo: route,);
                    }));
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
