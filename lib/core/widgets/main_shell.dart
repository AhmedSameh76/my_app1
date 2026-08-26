import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app1/core/Routing/routes.dart';
import 'package:my_app1/core/di/debendncy_injection.dart';
import 'package:my_app1/features/appoinments/presentation/cubit/appoinments_cubit.dart';

// 👈 استدعينا الشاشة الصح اللي إحنا عملناها بتاعت ليستة الحجوزات 
import 'package:my_app1/features/appoinments/presentation/screens/appoinmentt.dart'; // تأكد من اسم مسار الملف لو مختلف عندك

import 'package:my_app1/features/home/presentation/cubit/home_cubit.dart';
import 'package:my_app1/features/home/presentation/screens/home_screen.dart';
import 'package:my_app1/features/profile/cubit/profile_cubit.dart';
import 'package:my_app1/features/profile/ui/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // 👈 هنا حطينا Appoinmentt بدل AppointmentScreens
  final List<Widget> _screens = const [
    HomeScreen(),
    Appoinmentt(), 
    Center(child: Text('Notifications Screen')),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => getIt<HomeCubit>()..getSpecializations(),
        ),
        BlocProvider<AppoinmentsCubit>(
          create: (context) => getIt<AppoinmentsCubit>()..getAppointment(date: ''), 
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => getIt<ProfileCubit>()..getUserProfile(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            extendBody: true,
            body: IndexedStack(index: _currentIndex, children: _screens),

            floatingActionButton: Transform.translate(
              offset: const Offset(0, 15),
              child: FloatingActionButton(
                onPressed: () {
                  context.push(Routes.search);
                },
                shape: const CircleBorder(),
                backgroundColor: Colors.blue,
                elevation: 3,
                child: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 8.0,
              color: Colors.white,
              elevation: 10,
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(
                      icon: Icons.home_rounded,
                      label: 'Home',
                      index: 0,
                      context: context,
                    ),
                    _buildNavItem(
                      icon: Icons.calendar_month_rounded,
                      label: 'Appointments',
                      index: 1,
                      context: context,
                    ),

                    const SizedBox(width: 32),

                    _buildNavItem(
                      icon: Icons.notifications_rounded,
                      label: 'Notifications',
                      index: 2,
                      context: context,
                    ),
                    _buildNavItem(
                      icon: Icons.person_rounded,
                      label: 'Profile',
                      index: 3,
                      context: context,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required BuildContext context,
  }) {
    final isSelected = _currentIndex == index;
    const activeColor = Colors.blue;
    final inactiveColor = Colors.grey[400];

    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });

        // ريفريش للداتا لما يدوس على تاب المواعيد
        if (index == 1) {
          context.read<AppoinmentsCubit>().getAppointment(date: '');
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? activeColor : inactiveColor,
              size: 24,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? activeColor : inactiveColor,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}