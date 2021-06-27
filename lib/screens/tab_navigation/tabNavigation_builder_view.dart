import 'package:auto_route/auto_route.dart';
import 'package:daily_sillimanian_beta/app/router.gr.dart';
import 'package:daily_sillimanian_beta/screens/tab_navigation/tabNavigationItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabNavigationBuilderView extends StatelessWidget {
  const TabNavigationBuilderView({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoRouter(),
      bottomNavigationBar: Consumer(
        builder: (context, watch, _) {
          int _currentIndex = watch(currentIndexState);
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (value) {
              context
                  .read(currentIndexState.notifier)
                  .currentIndex(context, value);
            },
            items: [
              for (final tabItem in TabNavigationItem.items)
                BottomNavigationBarItem(
                  icon: tabItem.icon,
                  activeIcon: tabItem.activeIcon,
                  label: tabItem.title,
                )
            ],
          );
        },
      ),
    );
  }
}

final currentIndexState =
    StateNotifierProvider<CurrentIndexState, int>((ref) => CurrentIndexState());

class CurrentIndexState extends StateNotifier<int> {
  CurrentIndexState() : super(0);

  void currentIndex(BuildContext context, int val) {
    state = val;
    AutoRouter.innerRouterOf(context, TabNavigationBuilderRoute.name)
        ?.navigate(TabNavigationItem.items[val].page);
  }
}