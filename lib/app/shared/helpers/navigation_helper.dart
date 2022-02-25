import 'package:flutter_modular/flutter_modular.dart';

class NavigationHelper {
  static Future<dynamic> navigateTo(String route, {Object? args}) =>
      Modular.to.pushNamed(route, arguments: args);

  static Future<dynamic> navigateToReplacement(String route, {Object? args}) =>
      Modular.to.pushReplacementNamed(
        route,
        arguments: args ?? '',
      );

  static void pushNamedAndRemoveUntil(String route, {Object? args}) => Modular.to.navigate(
        route,
        arguments: args ?? '',
      );
}
