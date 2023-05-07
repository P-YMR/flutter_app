import '../../index.dart';

enum AppRoutes {
  initial(AuthActivity.route),
  home(HomeActivity.route);

  final String route;

  const AppRoutes(this.route);

  factory AppRoutes.from(String? name) {
    if (name == AppRoutes.home.route) {
      return AppRoutes.home;
    } else {
      return AppRoutes.initial;
    }
  }
}
