import 'package:meupet/app/app_module.dart';
import 'package:meupet/app/modules/auth/login/login_screen.dart';
import 'package:meupet/app/modules/auth/register/register_screen.dart';
import 'package:meupet/app/services/user/user_service.dart';
import 'package:provider/provider.dart';

import '../../core/modules/pet_module.dart';
import 'login/login_controller.dart';

class AuthModule extends PetModule {
  AuthModule()
      : super(bindings: [
          ChangeNotifierProvider(
              create: (context) => LoginController(userService: context.read()))
        ], routers: {
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen()
        });
}
