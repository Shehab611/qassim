import 'package:flutter/material.dart';
import 'package:qassim/features/drawer/presentation/view/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home Screen'),
      ),
      drawer: AppDrawer(),
    );
  }
}
