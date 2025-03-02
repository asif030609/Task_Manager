import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/Inprogress_task_screen.dart';
import 'package:task_manager/ui/screens/auth/update_profile_screen.dart';
import 'package:task_manager/ui/screens/cancelled_task_screen.dart';
import 'package:task_manager/ui/screens/completed_task_screen.dart';
import 'package:task_manager/ui/screens/new_task_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    NewTaskScreen(),
    CompletedTaskScreen(),
    InprogressTaskScreen(),
    CancelledTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppbar(context),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _selectedIndex = index;
          if (mounted) {
            setState(() {});
          }
        },
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.new_label,
              ),
              label: 'New Task'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.new_label,
              ),
              label: 'Completed'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.new_label,
              ),
              label: 'In Progress'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.new_label,
              ),
              label: 'Cancelled'),
        ],
      ),
    );
  }
}

AppBar ProfileAppbar(context,[bool fromUpdateProfile=false]) {
  return AppBar(
    title: GestureDetector(
      onTap: () {
        if(fromUpdateProfile){
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UpdateProfileScreen(),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dummy Name',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Text(
            'email@gmail.com',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          )
        ],
      ),
    ),
    actions: [
      Icon(Icons.logout_outlined),
    ],
    leading: GestureDetector(
      onTap: () {
        if(fromUpdateProfile){
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UpdateProfileScreen(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(),
      ),
    ),
    backgroundColor: AppColors.primaryColor,
  );
}
