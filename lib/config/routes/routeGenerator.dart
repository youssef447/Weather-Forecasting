/* 
import 'package:flutter/material.dart';

import 'pageRouteBuilder.dart';
import 'routes.dart';

class RouteGenerator {
  RouteGenerator._();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.cartDetailsScreen:
        if (args is List<dynamic>) {
          return DefaultPageRouteBuilder.animatedScaleRoute(
            screen: DetailsScreen(
              coffee: args[0],
              cartPage: args[1],
            ),
          );
        }
      case AppRoutes.detailsScreen:
        if (args is Coffee) {
          return DefaultPageRouteBuilder.animatedScaleRoute(
            screen: DetailsScreen(
              coffee: args,
            ),
          );
        }

      case AppRoutes.homeScreen:
        return DefaultPageRouteBuilder.animatedScaleRoute(
            screen: const ResponsiveHelper(
                mobileWidget: MobileHomeScreen(),
                desktopWidget: DesktopHomeScreen()));

      case AppRoutes.paymentScreen:
        return DefaultPageRouteBuilder.animatedLeftRoute(
          screen: const PaymentScreen(),
        );
    }
    return MaterialPageRoute(
      builder: (context) => const UnknownScreen(),
    );
  }
}
 */