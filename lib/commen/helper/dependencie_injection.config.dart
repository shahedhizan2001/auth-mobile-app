// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../feature/auth/application/facade.dart' as _i6;
import '../../feature/auth/domain/repo/repo.dart' as _i4;
import '../../feature/auth/infrastructure/data_source/remote/remote.dart'
    as _i3;
import '../../feature/auth/infrastructure/repo/repo_impl.dart' as _i5;
import '../../feature/auth/presentation/state/auth_bloc.dart' as _i7;

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
    gh.factory<_i3.AuthRemote>(() => _i3.AuthRemote());
    gh.factory<_i4.IAuthRepo>(
        () => _i5.AuthRepoImpl(authRemote: gh<_i3.AuthRemote>()));
    gh.factory<_i6.AuthFacade>(() => _i6.AuthFacade(repo: gh<_i4.IAuthRepo>()));
    gh.factory<_i7.AuthBloc>(() => _i7.AuthBloc(gh<_i6.AuthFacade>()));
    return this;
  }
}
