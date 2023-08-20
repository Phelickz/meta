import "package:injectable/injectable.dart";
import "package:meta_trader/app/router/router.dart";
    
@lazySingleton
class RouterService {
  final MetaTraderRouter router = MetaTraderRouter();
}