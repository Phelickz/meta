// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:meta_trader/app/services/forex_news_client_service.dart' as _i3;
import 'package:meta_trader/app/services/router_service.dart' as _i4;
import 'package:meta_trader/app/services/snackbar_service.dart' as _i5;
import 'package:meta_trader/app/services/theme_service.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ForexNewsService>(() => _i3.ForexNewsService());
    gh.lazySingleton<_i4.RouterService>(() => _i4.RouterService());
    gh.lazySingleton<_i5.SnackBarService>(() => _i5.SnackBarService());
    gh.lazySingleton<_i6.ThemeServices>(() => _i6.ThemeServices());
    return this;
  }
}
