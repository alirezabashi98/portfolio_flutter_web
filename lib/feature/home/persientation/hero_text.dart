import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/extenstion/extenstions.dart';
import 'package:portfolio/core/widgets/seo_text.dart';
import 'package:portfolio/style/app_instes.dart';
// import 'package:seo_renderer/seo_renderer.dart';

class HeroText extends StatelessWidget {
  const HeroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: context.isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        SEOText(
          context.texts.alirezaBashi,
          textAlign: textAlign(context),
          style: context.textStyle.titleLgBold.copyWith(
            color: context.colorScheme.onSurface,
          ),
          // textRendererStyle: TextRendererStyle.header1,
        ),
        Gap(Instes.sm),
        SEOText(
          context.texts.flutterDeveloper,
          textAlign: textAlign(context),
          style: context.textStyle.titleMdMedium.copyWith(
            color: context.colorScheme.onSurface,
          ),
          // textRendererStyle: TextRendererStyle.header1,
        ),
        Gap(Instes.lg),
        SEOText(
          context.texts.aboutAlirezaBashi,
          textAlign: textAlign(context),
          style: context.textStyle.bodyMdMedium.copyWith(
            color: context.colorScheme.onSurface,
          ),
          // textRendererStyle: TextRendererStyle.header1,
        ),
      ],
    );
  }

  TextAlign textAlign(BuildContext context) {
    var isEnglish = context.locale.languageCode == 'en';
    if (context.isMobile) {
      return TextAlign.center;
    } else if (isEnglish) {
      return TextAlign.left;
    } else {
      return TextAlign.right;
    }
  }
}
