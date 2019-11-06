

enum HomeSelected { HOME, FIRST, SECOND, TREE }

class Home {
  final String name;
  final String url;

  HomeSelected selectedHome = HomeSelected.HOME;

  Home({this.name, this.url});
}
