import 'package:meupet/app/services/user/user_service.dart';

import '../../../core/notifier/default_notifier.dart';

class LoginController extends DefaultChangeNotifier {
  UserService _userService;

  LoginController({required UserService userService})
      : _userService = userService;
}
