class Instes {
  static double get xs => 4;
  static double get xl => 24;
  static double get xxl => 32;
  static double get xxxl => 80;
  static double get med => 12;
  static double get sm => 16;
  static double get lg => 24;
  static const double maxWitdh = 1280;
}

abstract class AppInstes {
  double get paddingHorizontal;
  double get paddingVertical;
  double get appBarHeight;
}

class SmallInstes extends AppInstes {
  @override
  double get paddingHorizontal => 16;

  @override
  double get appBarHeight => 56;

  @override
  double get paddingVertical => 8;
}

class LargeInstes extends AppInstes {
  @override
  double get paddingHorizontal => 80;

  @override
  double get appBarHeight => 64;

  @override
  double get paddingVertical => 40;
}
