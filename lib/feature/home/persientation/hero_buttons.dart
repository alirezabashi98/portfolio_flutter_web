import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_link.dart';
import 'package:portfolio/core/extenstion/extenstions.dart';
import 'package:portfolio/core/widgets/styled_button.dart';
import 'package:portfolio/style/app_instes.dart';
import 'package:url_launcher/url_launcher.dart';

class LargeHeroButtons extends StatelessWidget {
  const LargeHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: Instes.lg,
      children: [
        PrimaryButton(
          title: context.texts.linkedin,
          onPressed: () async {
            await launchUrl(AppLink.linkedin);
          },
        ),
        OutlineButton(
          title: context.texts.email,
          onPressed: () async {
            await launchUrl(AppLink.emailLaunchUri);
          },
        ),
      ],
    );
  }
}

class SmallHeroButtons extends StatelessWidget {
  const SmallHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Instes.lg,
      children: [
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            title: context.texts.linkedin,
            onPressed: () async {
              await launchUrl(AppLink.linkedin);
            },
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: OutlineButton(
            title: context.texts.email,
            onPressed: () async {
              await launchUrl(AppLink.emailLaunchUri);
            },
          ),
        ),
      ],
    );
  }
}
