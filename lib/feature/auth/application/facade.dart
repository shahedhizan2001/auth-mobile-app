import 'package:injectable/injectable.dart';

import '../domain/repo/repo.dart';
import '../infrastructure/model/auth.dart';

@injectable
class AuthFacade {
  final IAuthRepo _repo;

  AuthFacade({required IAuthRepo repo}) : _repo = repo;

  Future<User> login({required Map<String, dynamic> data}) async =>
      await _repo.login(data);

  Future<User> register({required Map<String, dynamic> data}) async =>
      await _repo.register(data);
  Future<User> GetUser({required int id}) async =>
      await _repo.getUser(id);
  Future<User> deleteUser({required int id}) async =>
      await _repo.getUser(id);
}
