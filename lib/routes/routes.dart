import 'package:auto_route/auto_route.dart';
import 'package:breather/pages/practic-page.dart';
import 'package:breather/pages/list-page.dart';
import 'package:breather/pages/main-page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: BreatheMainPage, name: 'MainPageRouter', path: '/', children: [
      AutoRoute(
          page: EmptyRouterPage,
          name: 'BrPageRouter',
          path: 'BrPageRouter',
          children: [
            AutoRoute(
                page: BreathePracticPage,
                name: 'BreathePracticPageRouter',
                path: 'BreathePracticPageRouter/:id',
                initial: true),
          ]),
      AutoRoute(page: BreatheListPage, name: 'ListPageRouter', path: ''),
    ]),
  ],
)
class $AppRouter {}
