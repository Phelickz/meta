import 'package:meta_trader/app/core/custom_base_view_model.dart';

class HomeViewModel extends CustomBaseViewModel {
  Future<void> init() async {}

  int _counter = 0;
  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }
}
