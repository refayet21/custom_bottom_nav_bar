import 'package:bloc/bloc.dart';
import '../models/page_model.dart';

class NavigationState {
  final NavBarItem selectedItem;
  NavigationState(this.selectedItem);
}

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavBarItem.home));

  void navigateTo(NavBarItem item) {
    emit(NavigationState(item));
  }
}
