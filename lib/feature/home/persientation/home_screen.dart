import 'package:flutter/material.dart';
import 'package:portfolio/core/widgets/appbar/my_app_bar.dart';
import 'package:portfolio/core/widgets/background_blur.dart';
import 'package:portfolio/feature/home/persientation/hero_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundBlur(),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: HeroWidget(),
          ),
          MyAppBar(),
        ],
      ),
    );
  }
}
