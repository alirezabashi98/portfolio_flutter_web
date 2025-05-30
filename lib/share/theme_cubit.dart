import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_share_perf.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit(this.sharePerf) : super(true);
  final AppSharePerf sharePerf;

  Future<void> init() async {
    emit(await sharePerf.getAppTheme());
  }

  Future<void> change(bool isDark) async {
    emit(isDark);
    await sharePerf.setAppTheme(isDark);
  }
}
