import 'package:custom_bottom_nav_bar/blocs/navigation_bloc.dart';
import 'package:custom_bottom_nav_bar/models/page_model.dart';
import 'package:custom_bottom_nav_bar/views/home_page.dart';
import 'package:custom_bottom_nav_bar/views/notifications_page.dart';
import 'package:custom_bottom_nav_bar/views/profile_page.dart';
import 'package:custom_bottom_nav_bar/views/search_page.dart';
import 'package:custom_bottom_nav_bar/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Custom Bottom Navigation Bar',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF2980B9),
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return IndexedStack(
            index: _getIndex(state.selectedItem),
            children: _pages,
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  int _getIndex(NavBarItem item) {
    switch (item) {
      case NavBarItem.home:
        return 0;
      case NavBarItem.search:
        return 1;
      case NavBarItem.notifications:
        return 2;
      case NavBarItem.profile:
        return 3;
    }
  }
}
