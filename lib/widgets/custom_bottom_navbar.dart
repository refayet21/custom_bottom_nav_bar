import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/page_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/navigation_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF6DD5FA),
            Color(0xFF2980B9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.5),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.5),
            blurRadius: 30,
            offset: Offset(0, 15),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, Icons.home, NavBarItem.home),
          _buildNavItem(context, Icons.search, NavBarItem.search),
          _buildNavItem(context, Icons.notifications, NavBarItem.notifications),
          _buildNavItem(context, Icons.person, NavBarItem.profile),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, NavBarItem item) {
    final cubit = context.watch<NavigationCubit>();
    final isSelected = cubit.state.selectedItem == item;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          HapticFeedback.lightImpact();
          context.read<NavigationCubit>().navigateTo(item);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 400),
              transform: isSelected
                  ? (Matrix4.identity()
                    ..scale(1.4)
                    ..translate(0.0, -8.0)
                    ..rotateZ(0.05))
                  : Matrix4.identity(),
              child: AnimatedScale(
                scale: isSelected ? 1.3 : 1.0,
                duration: Duration(milliseconds: 400),
                curve: Curves.easeOutBack,
                child: Icon(
                  icon,
                  color: isSelected ? Colors.white : Colors.grey.shade300,
                  size: isSelected ? 35 : 28,
                ),
              ),
            ),
            SizedBox(height: 8),
            AnimatedOpacity(
              opacity: isSelected ? 1.0 : 0.7,
              duration: Duration(milliseconds: 300),
              child: Text(
                item.toString().split('.').last.capitalize(),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey.shade300,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: isSelected ? 16 : 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    if (this.isEmpty) return '';
    return '${this[0].toUpperCase()}${this.substring(1).toLowerCase()}';
  }
}
