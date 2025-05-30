import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerMenuCubit extends Cubit<bool> {
  DrawerMenuCubit() : super(false);

  void openMenu() => emit(true);

  void closeMenu() => emit(false);
}
