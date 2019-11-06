import 'package:flutter/cupertino.dart';
import 'package:menu_example/models/home/home.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final _homeInfo = BehaviorSubject<Home>();

  Observable<Home> get homeData => _homeInfo.stream;

  Sink<Home> get homeValue => _homeInfo.sink;

  getHome() async {
    var value = Home(
        name: "Senku ishigami",
        url:
            'https://assets1.ignimgs.com/thumbs/userUploaded/2019/5/29/drstone-1559174341319.jpg',
     );

    await Future.delayed(Duration(seconds: 1), () => homeValue.add(value));
  }


  setPageActual(HomeSelected selected) {
    homeData.firstWhere((home) {
      home.selectedHome = selected;
      homeValue.add(home);
      return true;
    });
  }

  @mustCallSuper
  dispose() async {
    await _homeInfo.drain();
    await _homeInfo.close();
  }
}

final blocHome = HomeBloc();
