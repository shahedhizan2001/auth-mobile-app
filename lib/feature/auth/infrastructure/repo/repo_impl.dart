import 'package:auth/commen/service/storage_service.dart';
import 'package:auth/feature/auth/domain/repo/repo.dart';
import 'package:injectable/injectable.dart';

import '../data_source/remote/remote.dart';
import '../model/auth.dart';

@Injectable(as: IAuthRepo)
class AuthRepoImpl implements IAuthRepo {
  final AuthRemote _authRemote;

  AuthRepoImpl(
      {required AuthRemote authRemote,})
      :
        _authRemote = authRemote;


  @override
  Future<User> login(Map<String, dynamic> data) async {
    final result = await _authRemote.login(data);
    await StorageService.setToken(result.token!);
    await StorageService.setId(result.id!);
    return result;
  }

  @override
  Future<User> register(Map<String, dynamic> data) async {
    final result = await _authRemote.register(data);
    await StorageService.setId(result.id!);
    return result;
  }
  @override
  Future<User> getUser(int id) async {
   final result= await _authRemote.getUser(id: id);
   return result;
  }
  @override
  Future<User> deleteUser(int id) async {
    final result= await _authRemote.getUser(id: id);
    return result;
  }
}
