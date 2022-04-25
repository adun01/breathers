import 'package:auto_route/auto_route.dart';
import 'package:breather/pages/breathe-page.dart';
import 'package:breather/pages/list-page.dart';
import 'package:breather/pages/main-page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: MainPage, name: 'MainPageRouter', path: '/', children: [
      AutoRoute(
          page: EmptyRouterPage,
          name: 'BrPageRouter',
          path: 'BrPageRouter',
          children: [
            AutoRoute(
                page: BreathePage,
                name: 'BreathePageRouter',
                path: 'BreathePageRouter/:id',
                initial: true),
          ]),
      AutoRoute(page: ListPage, name: 'ListPageRouter', path: ''),
    ]),
  ],
)
class $AppRouter {}
