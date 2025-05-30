import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/extenstion/extenstions.dart';
import 'package:portfolio/core/widgets/appbar/my_app_bar.dart';
import 'package:portfolio/share/drawer_menu_cubit.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 200),
  );
  late final _animation = Tween<Offset>(
    begin: Offset(0, -1),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

  @override
  void initState() {
    super.initState();
    if (context.read<DrawerMenuCubit>().state) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerMenuCubit, bool>(
      listener: (context, isOpen) {
        if (isOpen) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      builder: (context, state) {
        return ClipRRect(
          child: SlideTransition(
            position: _animation,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: context.colorScheme.surface.withValues(alpha: .4),
                    blurRadius: 6,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: const SmallMenu(),
            ),
          ),
        );
      },
    );
  }
}
