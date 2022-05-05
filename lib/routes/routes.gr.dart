// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i5;

import '../pages/list-page.dart' as _i3;
import '../pages/main-page.dart' as _i1;
import '../pages/practic-page.dart' as _i4;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    MainPageRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.BreatheMainPage());
    },
    BrPageRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    ListPageRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.BreatheListPage());
    },
    BreathePracticPageRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<BreathePracticPageRouterArgs>(
          orElse: () =>
              BreathePracticPageRouterArgs(id: pathParams.getInt('id')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.BreathePracticePage(key: args.key, id: args.id));
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(MainPageRouter.name, path: '/', children: [
          _i2.RouteConfig(BrPageRouter.name,
              path: 'BrPageRouter',
              parent: MainPageRouter.name,
              children: [
                _i2.RouteConfig('#redirect',
                    path: '',
                    parent: BrPageRouter.name,
                    redirectTo: 'BreathePracticPageRouter/:id',
                    fullMatch: true),
                _i2.RouteConfig(BreathePracticPageRouter.name,
                    path: 'BreathePracticPageRouter/:id',
                    parent: BrPageRouter.name)
              ]),
          _i2.RouteConfig(ListPageRouter.name,
              path: '', parent: MainPageRouter.name)
        ])
      ];
}

/// generated route for
/// [_i1.BreatheMainPage]
class MainPageRouter extends _i2.PageRouteInfo<void> {
  const MainPageRouter({List<_i2.PageRouteInfo>? children})
      : super(MainPageRouter.name, path: '/', initialChildren: children);

  static const String name = 'MainPageRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class BrPageRouter extends _i2.PageRouteInfo<void> {
  const BrPageRouter({List<_i2.PageRouteInfo>? children})
      : super(BrPageRouter.name,
            path: 'BrPageRouter', initialChildren: children);

  static const String name = 'BrPageRouter';
}

/// generated route for
/// [_i3.BreatheListPage]
class ListPageRouter extends _i2.PageRouteInfo<void> {
  const ListPageRouter() : super(ListPageRouter.name, path: '');

  static const String name = 'ListPageRouter';
}

/// generated route for
/// [_i4.BreathePracticePage]
class BreathePracticPageRouter
    extends _i2.PageRouteInfo<BreathePracticPageRouterArgs> {
  BreathePracticPageRouter({_i5.Key? key, required int id})
      : super(BreathePracticPageRouter.name,
            path: 'BreathePracticPageRouter/:id',
            args: BreathePracticPageRouterArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'BreathePracticPageRouter';
}

class BreathePracticPageRouterArgs {
  const BreathePracticPageRouterArgs({this.key, required this.id});

  final _i5.Key? key;

  final int id;

  @override
  String toString() {
    return 'BreathePracticPageRouterArgs{key: $key, id: $id}';
  }
}
