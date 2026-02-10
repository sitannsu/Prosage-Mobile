import 'package:flutter/material.dart';
import '../../core/responsive/responsive.dart';
import '../../core/theme/app_theme.dart';
import 'teacher_home_dashboard.dart';
import '../classes/my_classes_screen.dart';
import '../notifications/notifications_screen.dart';
import '../profile/profile_screen.dart';
import '../settings/settings_screen.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const TeacherHomeDashboard(),
    const ProfileScreen(),
    const SettingsScreen(),
    const NotificationsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _buildMobileLayout(),
      tablet: _buildTabletLayout(),
      desktop: _buildDesktopLayout(),
      tv: _buildTVLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        height: 90,
        decoration: const BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavBarItem(0, Icons.home, 'Home'),
            _buildNavBarItem(1, Icons.person_outline, 'Profile'),
            _buildNavBarItem(2, Icons.settings_outlined, 'Settings'),
            _buildNavBarItem(3, Icons.notifications_none, 'Notifications'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBarItem(int index, IconData icon, String label) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
                color: Colors.white.withOpacity(0.25),
                borderRadius: BorderRadius.circular(20),
              )
            : null,
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 28),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            labelType: NavigationRailLabelType.selected,
            destinations: const [
              NavigationRailDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: Text('Home')),
              NavigationRailDestination(icon: Icon(Icons.class_outlined), selectedIcon: Icon(Icons.class_), label: Text('Classes')),
              NavigationRailDestination(icon: Icon(Icons.notifications_outlined), selectedIcon: Icon(Icons.notifications), label: Text('Notifications')),
              NavigationRailDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: Text('Profile')),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: _screens,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Scaffold(
      body: Row(
        children: [
          _buildSidebarDrawer(),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: _screens,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTVLayout() {
    // For TV, use larger fonts and focus-based navigation logic if needed.
    // Here we use a wider sidebar with larger icons.
    return Scaffold(
      body: Row(
        children: [
          _buildSidebarDrawer(isTV: true),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: _screens,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarDrawer({bool isTV = false}) {
    return Container(
      width: isTV ? 300 : 250,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 32),
          // Logo or App Name
          Text(
            'Prosage',
            style: TextStyle(
              fontSize: isTV ? 32 : 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 32),
          _buildDrawerItem(0, 'Home', Icons.home_outlined, isTV),
          _buildDrawerItem(1, 'Classes', Icons.class_outlined, isTV),
          _buildDrawerItem(2, 'Notifications', Icons.notifications_outlined, isTV),
          _buildDrawerItem(3, 'Profile', Icons.person_outline, isTV),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(int index, String title, IconData icon, bool isTV) {
    final bool isSelected = _selectedIndex == index;
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? AppTheme.primaryColor : Colors.grey,
        size: isTV ? 32 : 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? AppTheme.primaryColor : Colors.grey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: isTV ? 20 : 16,
        ),
      ),
      onTap: () => _onItemTapped(index),
      selected: isSelected,
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: isTV ? 16 : 8),
    );
  }
}
