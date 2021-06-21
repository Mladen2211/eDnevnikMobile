import 'package:e_dnevnik/common/app.colors.dart';
import 'package:e_dnevnik/controllers/dashboard.controller.dart';
import 'package:e_dnevnik/pages/home.page.dart';
import 'package:e_dnevnik/pages/widgets/profile.page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.bgSideMenu,
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomePage(),
                // AlertsPage(),
                // AccountPage(),
                ProfilePage()
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: AppColor.accent.withOpacity(0.5),
            selectedItemColor: AppColor.accent,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColor.bgSideMenu.withRed(20),
            elevation: 15,
            items: [
              _bottomNavigationBarItem(
                icon: Icons.home,
                label: 'Naslovna',
              ),
              // _bottomNavigationBarItem(
              //   icon: CupertinoIcons.sportscourt,
              //   label: 'News',
              // ),
              // _bottomNavigationBarItem(
              //   icon: CupertinoIcons.bell,
              //   label: 'Alerts',
              // ),
              _bottomNavigationBarItem(
                icon: Icons.person,
                label: 'Profil',
              ),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}