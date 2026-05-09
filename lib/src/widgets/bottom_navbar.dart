import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MyBottomNavBar extends StatefulWidget {
  /// Pass a list of actual pages to be displayed when a particular nav bar item is tapped and a list of [CurvedNavigationBarItem] to be shown in the nav bar.
  final List<Widget> mainPages;

  /// The items to be shown in the navbar.
  final List<MyNavBarItem> navBarItems;
  final int initialIndex;
  final Color? navBarBackgroundColor;
  final Color? navBarButtonBackgroundColor;
  final double? navBarHeight;
  final Curve? animation;
  final Duration? animationDuration;

  const MyBottomNavBar({
    super.key,
    required this.mainPages,
    required this.navBarItems,
    this.initialIndex = 0,
    this.navBarBackgroundColor,
    this.navBarButtonBackgroundColor,
    this.navBarHeight,
    this.animation,
    this.animationDuration,
  });

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    // NOTE: myColorScheme not yet applied
    // ColorScheme myColorScheme = Theme.of(context).colorScheme;
    // Color labelAndIconColor = myColorScheme.secondary;

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        animationCurve: widget.animation ?? Curves.fastEaseInToSlowEaseOut,
        animationDuration:
            widget.animationDuration ?? const Duration(milliseconds: 600),
        backgroundColor: widget.navBarBackgroundColor ?? Colors.transparent,
        height: widget.navBarHeight ?? kBottomNavigationBarHeight,
        items: widget.navBarItems.map((item) {
          return _navBarItem(icon: item.icon, label: item.label);
        }).toList(),
      ),
      body: IndexedStack(index: currentIndex, children: widget.mainPages),
      extendBody: true,
    );
  }

  CurvedNavigationBarItem _navBarItem({
    required Icon icon,
    required String label,
  }) {
    return CurvedNavigationBarItem(icon: icon, label: label);
  }
}

/// A subclass for MyBottomNavBar
class MyNavBarItem {
  String label;
  Icon icon;

  MyNavBarItem({required this.label, required this.icon});
}
