import 'package:meupet/app/models/users_model.dart';

abstract class UserRepository {
  Future<void> register(String email, String password, String confirm_password);
  Future<List<UsersModel>> getUserInfo();
}
