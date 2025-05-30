import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants/app_icon.dart';
import 'package:portfolio/core/extenstion/extenstions.dart';
import 'package:portfolio/core/widgets/seo_text.dart';
import 'package:portfolio/share/locale_cubit.dart';

class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 0,
            child: PopupLanguageSwitchItem(
              language: 'English',
              icon: AppIcon.us,
            ),
          ),
          PopupMenuItem(
            value: 1,
            child: PopupLanguageSwitchItem(language: 'فارسی', icon: AppIcon.ir),
          ),
        ];
      },
      initialValue: context.locale.languageCode == 'en' ? 0 : 1,
      onSelected: (value) {
        context.read<LocaleCubit>().change(value == 0 ? 'en' : 'fa');
      },
      child: Row(
        spacing: 4,
        children: [
          Icon(Icons.language, color: context.colorScheme.onSurface),
          SEOText(context.locale.languageCode == 'en' ? 'En' : 'فا'),
        ],
      ),
    );
  }
}

class PopupLanguageSwitchItem extends StatelessWidget {
  const PopupLanguageSwitchItem({
    super.key,
    required this.language,
    required this.icon,
  });
  final String language;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(icon, width: 18, height: 18),
        SEOText(language),
      ],
    );
  }
}
