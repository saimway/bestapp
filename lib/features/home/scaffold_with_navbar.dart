import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/theme/app_theme.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavBar({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    // Get the Glassmorphism theme extension
    final glassTheme = Theme.of(context).extension<GlassmorphismTheme>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBody: true, // Important for glassmorphism
      body: child,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: (isDark ? Colors.black : Colors.white).withOpacity(glassTheme?.opacity ?? 0.1),
          border: Border.all(
            color: (isDark ? Colors.white : Colors.black).withOpacity(0.1),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: glassTheme?.blurStrength ?? 10,
              sigmaY: glassTheme?.blurStrength ?? 10
            ),
            child: NavigationBar(
              height: 70,
              backgroundColor: Colors.transparent,
              indicatorColor: Theme.of(context).primaryColor.withOpacity(0.2),
              elevation: 0,
              selectedIndex: _calculateSelectedIndex(context),
              onDestinationSelected: (int index) => _onItemTapped(index, context),
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              destinations: const [
                NavigationDestination(
                  icon: Icon(LucideIcons.home),
                  selectedIcon: Icon(LucideIcons.home, color: Color(0xFF7C3AED)),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(LucideIcons.search),
                  selectedIcon: Icon(LucideIcons.search, color: Color(0xFF7C3AED)),
                  label: 'Search',
                ),
                NavigationDestination(
                  icon: Icon(LucideIcons.settings),
                  selectedIcon: Icon(LucideIcons.settings, color: Color(0xFF7C3AED)),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/search')) return 1;
    if (location.startsWith('/settings')) return 2;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/search'); // We'll stub this or use it as a placeholder
        break;
      case 2:
        context.go('/settings');
        break;
    }
  }
}
