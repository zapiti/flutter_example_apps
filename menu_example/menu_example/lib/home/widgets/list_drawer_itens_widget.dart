import 'package:flutter/material.dart';
import 'package:menu_example/bloc/home/home_bloc.dart';
import 'package:menu_example/home/widgets/title_widget.dart';
import 'package:menu_example/models/home/home.dart';

import 'drawer_button_widget.dart';

Widget listDrawerItems(bool drawerStatus) {
  return StreamBuilder<Home>(
      stream: blocHome.homeData,
      builder: (BuildContext context, AsyncSnapshot<Home> snapshot) {
        return ListView(
          children: <Widget>[
            Container(
              height: 50,
              child: Center(
                child: titleWidget(),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 5,
              color: Colors.orange,
            ),
            Container(
              margin: EdgeInsets.only(left: 8),
              child: Row(
                children: <Widget>[
                  Container(
                    child: snapshot.data?.url != null
                        ? CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                NetworkImage(snapshot.data?.url ?? ""))
                        : SizedBox(
                            width: 20,
                          ),
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          child: Text(
                            snapshot.data?.name ?? "",
                            style: TextStyle(fontSize: 18),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 0.4,
              color: Colors.grey[300],
            ),
            DrawerButton(
                active: snapshot.data?.selectedHome == HomeSelected.HOME,
                context: context,
                title: "Inicio",
                iconData: Icons.dashboard,
                onPressed: () {
                  blocHome.setPageActual(HomeSelected.FIRST);
                  drawerStatus ? Navigator.pop(context) : print("");
                }),
            DrawerButton(
                active: snapshot.data?.selectedHome == HomeSelected.SECOND,
                context: context,
                title: "Segundo",
                iconData: Icons.insert_chart,
                onPressed: () {
                  blocHome.setPageActual(HomeSelected.SECOND);
                  drawerStatus ? Navigator.pop(context) : print("");
                }),
            DrawerButton(
                active: snapshot.data?.selectedHome == HomeSelected.TREE,
                context: context,
                title: "Terceiro",
                iconData: Icons.content_paste,
                onPressed: () {
                  blocHome.setPageActual(HomeSelected.FIRST);
                  drawerStatus ? Navigator.pop(context) : print("");
                })
          ],
        );
      });
}
