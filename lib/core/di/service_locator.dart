import 'package:get_it/get_it.dart';
import 'package:portfolio/share/app_share_perf.dart';

var getIt = GetIt.instance;

Future<void> initServiceLocator() async {
  getIt.registerSingleton(AppSharePerf());
}
