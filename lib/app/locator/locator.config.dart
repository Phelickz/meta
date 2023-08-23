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
import 'package:meta_trader/app/services/router_service.dart' as _i3;
import 'package:meta_trader/app/services/snackbar_service.dart' as _i4;
import 'package:meta_trader/app/services/theme_service.dart' as _i5;

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
    gh.lazySingleton<_i3.RouterService>(() => _i3.RouterService());
    gh.lazySingleton<_i4.SnackBarService>(() => _i4.SnackBarService());
    gh.lazySingleton<_i5.ThemeServices>(() => _i5.ThemeServices());
    return this;
  }
}
