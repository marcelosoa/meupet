import 'package:meupet/app/models/users_model.dart';
import 'package:meupet/app/repositories/user/user_repository.dart';
import 'package:meupet/app/services/user/user_service.dart';

class UserServiceImpl extends UserService {
  final UserRepository _userRepository;

  UserServiceImpl({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<void> register(String name, String password, String confirm_password,
          String email) =>
      _userRepository.register(email, password, confirm_password);

  @override
  Future<List<UsersModel>> getUserInfo() => _userRepository.getUserInfo();
}
