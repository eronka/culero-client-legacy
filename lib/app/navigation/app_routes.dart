/// The routes of this app
enum AppRoute {
  splash("/"),
  login("/login"),
  home("/home"),
  ;

  final String path;

  const AppRoute(this.path);
}
