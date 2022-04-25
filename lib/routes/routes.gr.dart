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

import '../pages/breathe-page.dart' as _i4;
import '../pages/list-page.dart' as _i3;
import '../pages/main-page.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    MainPageRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.MainPage());
    },
    BrPageRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    ListPageRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.ListPage());
    },
    BreathePageRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<BreathePageRouterArgs>(
          orElse: () => BreathePageRouterArgs(id: pathParams.getInt('id')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.BreathePage(key: args.key, id: args.id));
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
                    redirectTo: 'BreathePageRouter/:id',
                    fullMatch: true),
                _i2.RouteConfig(BreathePageRouter.name,
                    path: 'BreathePageRouter/:id', parent: BrPageRouter.name)
              ]),
          _i2.RouteConfig(ListPageRouter.name,
              path: '', parent: MainPageRouter.name)
        ])
      ];
}

/// generated route for
/// [_i1.MainPage]
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
/// [_i3.ListPage]
class ListPageRouter extends _i2.PageRouteInfo<void> {
  const ListPageRouter() : super(ListPageRouter.name, path: '');

  static const String name = 'ListPageRouter';
}

/// generated route for
/// [_i4.BreathePage]
class BreathePageRouter extends _i2.PageRouteInfo<BreathePageRouterArgs> {
  BreathePageRouter({_i5.Key? key, required int id})
      : super(BreathePageRouter.name,
            path: 'BreathePageRouter/:id',
            args: BreathePageRouterArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'BreathePageRouter';
}

class BreathePageRouterArgs {
  const BreathePageRouterArgs({this.key, required this.id});

  final _i5.Key? key;

  final int id;

  @override
  String toString() {
    return 'BreathePageRouterArgs{key: $key, id: $id}';
  }
}
