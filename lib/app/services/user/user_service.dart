import '../../models/users_model.dart';

abstract class UserService {
  Future<void> register(
      String name, String password, String confirm_password, String email);
  Future<List<UsersModel>> getUserInfo();
}
