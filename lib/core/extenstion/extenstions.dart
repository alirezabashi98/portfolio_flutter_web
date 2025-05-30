import 'package:flutter/material.dart';
import 'package:portfolio/style/app_text_style.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/style/app_instes.dart';

enum FormFactoryType { mobile, tablet, desktop }

extension StyledCVontext on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);
  double get width => mq.size.width;
  double get height => mq.size.height;

  FormFactoryType get fromFactory {
    if (width < 600) {
      return FormFactoryType.mobile;
    } else if (width < 900) {
      return FormFactoryType.tablet;
    } else {
      return FormFactoryType.desktop;
    }
  }

  bool get isMobile => fromFactory == FormFactoryType.mobile;
  bool get isTablet => fromFactory == FormFactoryType.tablet;
  bool get isDesktop => fromFactory == FormFactoryType.desktop;

  AppTextStyle get textStyle {
    switch (fromFactory) {
      case FormFactoryType.mobile:
      case FormFactoryType.tablet:
        return SmallTextStyle();
      case FormFactoryType.desktop:
        return LargeTextStyle();
    }
  }

  AppInstes get instes {
    switch (fromFactory) {
      case FormFactoryType.mobile:
        return SmallInstes();
      case FormFactoryType.tablet:
      case FormFactoryType.desktop:
        return LargeInstes();
    }
  }

  AppLocalizations get texts =>
      AppLocalizations.of(this) ?? lookupAppLocalizations(const Locale('en'));

  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Locale get locale => Localizations.localeOf(this);
}
