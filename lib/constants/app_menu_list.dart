import 'package:flutter/material.dart';
import 'package:portfolio/core/extenstion/extenstions.dart';
import 'package:portfolio/routes/app_routes.dart';

class AppMenuList {
  static List<AppMenu> getItems(BuildContext context) {
    return [
      AppMenu(title: context.texts.home, path: AppRoutes.home),
      AppMenu(title: context.texts.courses, path: AppRoutes.courses),
      AppMenu(title: context.texts.blog, path: AppRoutes.blog),
      AppMenu(title: context.texts.aboutMe, path: AppRoutes.about),
    ];
  }
}

class AppMenu {
  final String title;
  final String path;

  AppMenu({required this.title, required this.path});
}
