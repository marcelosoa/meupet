import 'dart:convert';
import 'package:meupet/app/exceptions/exceptions.dart';
import 'package:meupet/app/models/users_model.dart';
import 'package:meupet/app/repositories/user/user_repository.dart';
import 'package:meupet/app/services/api/http_service.dart';

class UserRepositoryImpl implements UserRepository {
  final IHttpService _ihttpService;

  UserRepositoryImpl({required IHttpService iHttpService})
      : _ihttpService = iHttpService;

  @override
  Future<void> register(
      String email, String password, String confirm_password) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<List<UsersModel>> getUserInfo() async {
    final response = await _ihttpService.get(url: 'http://localhost:3000/hero');

    if (response.statusCode == 200) {
      final List<UsersModel> users = [];
      final body = jsonDecode(response.body);
      body[''].map((item) {
        final UsersModel user = UsersModel.fromMap(item);
        users.add(user);
      }).toList();
      return users;
    } else if (response.statusCode == 404) {
      throw Exceptions('Opa ocorreu um erro meu chapa');
    } else {
      throw Exception('Ioa opa ia');
    }
  }
}
