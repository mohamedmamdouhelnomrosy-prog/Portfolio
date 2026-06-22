import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_html/html.dart' as html;

import '../Features/Splash/presentation/pages/splash_view.dart';
import '../Features/home/presentation/pages/home_view.dart';
import '../Widgets/MainLayout/main_layout_widget.dart';

BuildContext? get CURRENT_CONTEXT =>
    GoRouterConfig.router.routerDelegate.navigatorKey.currentContext;

class GoRouterConfig {
  static String getServerUrl() {
    String completeUrl = html.window.location.href;
    Uri uri = Uri.parse(completeUrl);
    String serverUrl =
        '${uri.scheme}://${uri.host}${uri.hasPort ? ":${uri.port}" : ""}';
    print("com :${completeUrl}");
    return serverUrl;
  }

  static void popUntilPath(String pattern) {
    final RouteMatch lastMatch =
        _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();
    final router = GoRouter.of(CURRENT_CONTEXT!);

    while (location.contains(pattern)) {
      if (!router.canPop()) return;
      router.pop();
    }
  }

  static Future popAllFromBrowser() async {
    while (
        html.window.location.href.replaceAll(getServerUrl(), "").length > 2) {
      html.window.history.back();
      await Future.delayed(Duration.zero);
    }
  }

  static GoRouter get router => _router;
  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: SplashScreen.routeName,
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const SplashScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      ShellRoute(
          builder: (context, state, child) {
            return MainLayoutWidget(
              currentPath: state.fullPath,
              child: child,
            );
          },
          routes: [
            //// --------------------------  Home --------------------------
            GoRoute(
              name: HomeView.routeName,
              path: "/${HomeView.routeName}",
              pageBuilder: (_, GoRouterState state) {
                return getCustomTransitionPage(
                  state: state,
                  child: const HomeView(),
                );
              },
            )
            //     routes: <RouteBase>[
            //       //// --------------------------  Blog Details  --------------------------
            //       GoRoute(
            //         name: BlogsView.routeName,
            //         path: BlogsView.routeName,
            //         pageBuilder: (_, GoRouterState state) {
            //           return getCustomTransitionPage(
            //             state: state,
            //             child: const BlogsView(),
            //           );
            //         },
            //         routes: <RouteBase>[
            //           GoRoute(
            //               name: BlogDetailsView.routeName,
            //               path: BlogDetailsView.routeName,
            //               pageBuilder: (_, GoRouterState state) {
            //                 return getCustomTransitionPage(
            //                   state: state,
            //                   child: BlogDetailsView(
            //                     blogId: int.tryParse(state.uri.queryParameters["id"]??""),
            //                   ),
            //                 );
            //               },
            //               routes: const <RouteBase>[]),
            //         ],
            //       ),
            //
            //       //// --------------------------  profile --------------------------
            //       GoRoute(
            //           name: ProfileView.routeName,
            //           path: ProfileView.routeName,
            //           pageBuilder: (_, GoRouterState state) {
            //             return getCustomTransitionPage(
            //               state: state,
            //               child: const ProfileView(),
            //             );
            //           },
            //           routes: const <RouteBase>[]),
            //
            //       //// --------------------------  product Shipping Cart --------------------------
            //       GoRoute(
            //           name: ProductShippingCartView.routeName,
            //           path: ProductShippingCartView.routeName,
            //           pageBuilder: (_, GoRouterState state) {
            //             return getCustomTransitionPage(
            //               state: state,
            //               child: const ProductShippingCartView(),
            //             );
            //           },
            //           routes: <RouteBase>[
            //             //// --------------------------  Check Out --------------------------
            //             GoRoute(
            //                 name: CheckOutView.routeName,
            //                 path: CheckOutView.routeName,
            //                 pageBuilder: (_, GoRouterState state) {
            //                   return getCustomTransitionPage(
            //                     state: state,
            //                     child: CheckOutView(),
            //                   );
            //                 },
            //                 routes: <RouteBase>[
            //                   GoRoute(
            //                       name: BillView.routeName,
            //                       path: BillView.routeName,
            //                       pageBuilder: (_, GoRouterState state) {
            //                         return getCustomTransitionPage(
            //                           state: state,
            //                           child:  BillView(
            //                             orderID: int.tryParse(state.uri.queryParameters["id"]??"0")??0,
            //                           ),
            //                         );
            //                       },
            //                       routes: const <RouteBase>[]),
            //                 ]),
            //           ]),
            //
            //       //// --------------------------  Privacy Policy --------------------------
            //       GoRoute(
            //           name: PrivacyPolicyView.routeName,
            //           path: PrivacyPolicyView.routeName,
            //           pageBuilder: (_, GoRouterState state) {
            //             return getCustomTransitionPage(
            //               state: state,
            //               child: const PrivacyPolicyView(),
            //             );
            //           },
            //           routes: const <RouteBase>[]),
            //       // error page
            //       GoRoute(
            //         name: ErrorView.routeName,
            //         path: ErrorView.routeName,
            //         pageBuilder: (_, GoRouterState state) {
            //           return getCustomTransitionPage(
            //             state: state,
            //             child: ErrorView(
            //               arg: state.extra as ErrorPageArguments,
            //             ),
            //           );
            //         },
            //         routes: const <RouteBase>[],
            //       ),
            //     ]),
          ]),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      print("redirecting to ${state.fullPath}");
    },
  );

  static CustomTransitionPage getCustomTransitionPage(
      {required GoRouterState state, required Widget child}) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,

      /// i hava chaged this form 300 to 0
      transitionDuration: const Duration(milliseconds: 0),
      reverseTransitionDuration: Duration.zero,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}
