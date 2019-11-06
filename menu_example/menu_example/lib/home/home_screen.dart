import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_example/bloc/home/home_bloc.dart';
import 'package:menu_example/home/widgets/list_drawer_itens_widget.dart';
import 'package:menu_example/home/widgets/title_widget.dart';
import 'package:menu_example/models/home/home.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    blocHome.getHome();
  }

  @override
  void dispose() {
    blocHome.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MediaQuery.of(context).size.width < 1100
            ? AppBar(
                automaticallyImplyLeading:
                    MediaQuery.of(context).size.width < 1100 ? true : false,
                iconTheme: IconThemeData(color: Colors.orange),
                title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      titleWidget(),
                    ]),
                backgroundColor: Colors.white,
              )
            : null,
        body: Row(children: <Widget>[
          MediaQuery.of(context).size.width < 1100
              ? Container()
              : Card(
                  child: Container(
                      margin: EdgeInsets.all(0),
                      height: MediaQuery.of(context).size.height,
                      width: 300,
                      color: Colors.white,
                      child: listDrawerItems(false)),
                ),
          Container(
              width: MediaQuery.of(context).size.width < 1100
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width - 310,
              height: MediaQuery.of(context).size.height,
              child: StreamBuilder<Home>(
                  stream: blocHome.homeData,
                  builder:
                      (BuildContext context, AsyncSnapshot<Home> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return Container(
                          width: 200,
                          height: 200,
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.grey),
                            strokeWidth: 5,
                          ),
                        );
                      default:
                        if (snapshot.hasError)
                          return Container();
                        else {
                          switch (snapshot.data.selectedHome) {
                            case HomeSelected.FIRST:
                              return Container(
                                color: Colors.red,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                              );
                              break;
                            case HomeSelected.SECOND:
                              return Container(
                                color: Colors.yellow,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                              );
                              break;
                            case HomeSelected.TREE:
                              return Container(
                                color: Colors.black,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                              );
                              break;
                            default:
                              return Container(
                                color: Colors.purple,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                              );
                              break;
                          }
                        }
                    }
                  }))
        ]),
        drawer: Drawer(child: listDrawerItems(true)));
  }
}
