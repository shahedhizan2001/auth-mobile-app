

import '../../infrastructure/model/auth.dart';

abstract class IAuthRepo{
  Future<User> login(Map<String,dynamic> data);
  Future<User> register(Map<String,dynamic> data);
  Future<User> getUser(int id);
  Future<User> deleteUser(int id);
}