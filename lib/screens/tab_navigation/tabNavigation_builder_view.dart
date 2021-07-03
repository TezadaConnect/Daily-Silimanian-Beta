import 'package:auto_route/auto_route.dart';
import 'package:daily_sillimanian_beta/helpers/constants.dart';
import 'package:daily_sillimanian_beta/screens/tab_navigation/tabNavigationItem.dart';
import 'package:flutter/material.dart';

class TabNavigationBuilderView extends StatelessWidget {
  const TabNavigationBuilderView({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Log Out',
            style: Theme.of(context).primaryTextTheme.subtitle2,
          ),
          content: Text(
            "Are you sure you want to log out?",
            style: Theme.of(context)
                .primaryTextTheme
                .bodyText1!
                .copyWith(color: colorPalleteCaption),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'CANCEL',
                style: Theme.of(context)
                    .primaryTextTheme
                    .overline!
                    .copyWith(color: colorPalleteSecondary),
              ),
              onPressed: () => context.router.pop(false),
            ),
            TextButton(
              child: Text(
                'OK',
                style: Theme.of(context)
                    .primaryTextTheme
                    .overline!
                    .copyWith(color: colorPalletePrimary),
              ),
              onPressed: () => context.router.removeLast(),
            ),
          ],
        ),
      ),
      child: AutoTabsScaffold(
        routes: [
          for (final tabItem in TabNavigationItem.items) tabItem.page,
        ],
        bottomNavigationBuilder: buildBottomNav,
      ),
    );
  }

  BottomNavigationBar buildBottomNav(
      BuildContext context, TabsRouter tabsRouter) {
    return BottomNavigationBar(
      currentIndex: tabsRouter.activeIndex,
      onTap: tabsRouter.setActiveIndex,
      items: [
        for (final tabItem in TabNavigationItem.items)
          BottomNavigationBarItem(
            icon: tabItem.icon,
            activeIcon: tabItem.activeIcon,
            label: tabItem.title,
          )
      ],
    );
  }
}
