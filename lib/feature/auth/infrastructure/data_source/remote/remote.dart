import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../model/auth.dart';

@injectable
class AuthRemote {
  final _dio = Dio();

  Future<User> login(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(
        "https://dummyjson.com/auth/login",
        data: data,
      );
      print(response.data);
      return User.fromJson(response.data);
    } catch (error) {
      throw error;
    }
  }

  Future<User> register(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post("https://dummyjson.com/users/add",
          data: FormData.fromMap(data));
      print(response.data);
      return User.fromJson(response.data);
    } catch (error) {
      throw error;
    }
  }

  Future<User> getUser({required int? id}) async {
    try {
      final response = await _dio.get("https://dummyjson.com/users/$id");
      print(response.data);
      return User.fromJson(response.data);
    } catch (error) {
      throw error;
    }
  }
  Future<User> deleteUser({required int? id}) async {
    try {
      final response = await _dio.delete("https://dummyjson.com/users/$id");
      print(response.data);
      return User.fromJson(response.data);
    } catch (error) {
      throw error;
    }
  }
}
