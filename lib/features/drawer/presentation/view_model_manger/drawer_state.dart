part of 'drawer_cubit.dart';

abstract class DrawerState extends Equatable {
  const DrawerState();
}

class DrawerInitial extends DrawerState {
  const DrawerInitial();
  @override
  List<Object> get props => [];
}
class DrawerChangeLanguageState extends DrawerState {
  const DrawerChangeLanguageState();
  @override
  List<Object> get props => [];
}

