import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:meta_trader/app/locator/locator.config.dart';

final GetIt locator = GetIt.instance;

@InjectableInit()
void setupLocator() => locator.init();
