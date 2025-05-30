import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_share_perf.dart';

class LocaleCubit extends Cubit<String> {
  LocaleCubit(this.sharePerf) : super('en');
  final AppSharePerf sharePerf;

  Future<void> init() async {
    emit(await sharePerf.getAppLocale());
  }

  Future<void> change(String language) async {
    emit(language);
    await sharePerf.setAppLocale(language);
  }
}
