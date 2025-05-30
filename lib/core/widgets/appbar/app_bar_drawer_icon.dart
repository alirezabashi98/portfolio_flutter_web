import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/extenstion/extenstions.dart';
import 'package:portfolio/share/drawer_menu_cubit.dart';

class AppBarDrawerIcon extends StatefulWidget {
  const AppBarDrawerIcon({super.key});

  @override
  State<AppBarDrawerIcon> createState() => _AppBarDrawerIconState();
}

class _AppBarDrawerIconState extends State<AppBarDrawerIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);

    if (context.read<DrawerMenuCubit>().state) {
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (!context.read<DrawerMenuCubit>().state) {
          controller.forward();
          context.read<DrawerMenuCubit>().openMenu();
        } else {
          controller.reverse();
          context.read<DrawerMenuCubit>().closeMenu();
        }
      },
      icon: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: animation),
    );
  }
}
