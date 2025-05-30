import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/extenstion/extenstions.dart';
import 'package:portfolio/feature/home/persientation/hero_buttons.dart';
import 'package:portfolio/feature/home/persientation/hero_image.dart';
import 'package:portfolio/style/app_instes.dart';

import 'hero_text.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: context.instes.paddingHorizontal,
        vertical: context.instes.paddingVertical,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: Instes.maxWitdh),
        child: Column(
          spacing: Instes.xl,
          children: [
            if (context.isMobile) ...{
              Text(
                context.texts.flutter,
                style: context.textStyle.bodyMdMedium,
              ),
            },
            context.isMobile ? _SmallHero() : _LargeHero(),
          ],
        ),
      ),
    );
  }
}

class _SmallHero extends StatelessWidget {
  const _SmallHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 140),
          child: HeroImage(),
        ),
        Gap(Instes.xl),
        HeroText(),
        Gap(Instes.xxl),
        SmallHeroButtons(),
      ],
    );
  }
}

class _LargeHero extends StatelessWidget {
  const _LargeHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: HeroImage()),
        Gap(Instes.xxxl),
        Expanded(
          flex: 2,
          child: Column(
            spacing: Instes.xxl,
            children: [HeroText(), LargeHeroButtons()],
          ),
        ),
      ],
    );
  }
}
