import 'package:auto_route/auto_route.dart';
import 'package:breather/routes/routes.gr.dart';
import 'package:breather/widgets/layout/bottom-navigation-bar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [ListPageRouter(), BrPageRouter()],
      bottomNavigationBuilder: (_, index) {
        return BreBottomNavigationBar();
      },
    );
  }
}
