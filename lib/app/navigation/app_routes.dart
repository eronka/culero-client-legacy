/// The routes of this app
enum AppRoute {
  splash("/"),
  login("/login"),

  signup("/signup"),
  moreoptions("/signup/moreoptions"),
  signupemail("/signup/signupemail"),

  verifyemail("/signup/verifyemail"),
  emailverified("/signup/emailverified"),
  home("/home"),
  ;

  final String path;

  const AppRoute(this.path);
}
