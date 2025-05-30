import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/style/app_text_style.dart';
import 'package:portfolio/constants/app_menu_list.dart';
import 'package:portfolio/core/extenstion/extenstions.dart';
import 'package:portfolio/core/widgets/appbar/app_bar_drawer_icon.dart';
import 'package:portfolio/core/widgets/appbar/drawer_menu.dart';
import 'package:portfolio/share/drawer_menu_cubit.dart';
import 'package:portfolio/share/theme_cubit.dart';
import 'package:portfolio/style/app_instes.dart';

import '../language_switch.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerMenuCubit(),
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            color: context.theme.appBarTheme.backgroundColor,
            padding: EdgeInsets.symmetric(
              horizontal: context.instes.paddingHorizontal,
            ),
            height: context.instes.appBarHeight,
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: Instes.maxWitdh),
              child: Row(
                children: [
                  AppLogo(),
                  Spacer(),
                  if (context.isDesktop) LargeMenu(),
                  Spacer(),
                  LanguageSwitch(),
                  ThemeToggle(),
                  if (!context.isDesktop) AppBarDrawerIcon(),
                ],
              ),
            ),
          ),
          if (!context.isDesktop) const DrawerMenu(),
        ],
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(context.texts.protfolio, style: context.textStyle.titleLgBold);
  }
}

class LargeMenu extends StatelessWidget {
  const LargeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: AppMenuList.getItems(context)
          .map<LargeAppBarMenuItem>(
            (menu) => LargeAppBarMenuItem(
              text: menu.title,
              isSelected: false,
              onTap: () {},
            ),
          )
          .toList(),
    );
  }
}

class SmallMenu extends StatelessWidget {
  const SmallMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: AppMenuList.getItems(context)
          .map<LargeAppBarMenuItem>(
            (menu) => LargeAppBarMenuItem(
              text: menu.title,
              isSelected: false,
              onTap: () {},
            ),
          )
          .toList(),
    );
  }
}

class LargeAppBarMenuItem extends StatelessWidget {
  const LargeAppBarMenuItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Instes.med,
          vertical: Instes.xs,
        ),
        child: Text(text, style: SmallTextStyle().bodyLgMedium),
      ),
    );
  }
}

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: context.read<ThemeCubit>().state,
      onChanged: (isDark) {
        context.read<ThemeCubit>().change(isDark);
      },
    );
  }
}
