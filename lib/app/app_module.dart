import 'package:flutter/material.dart';
import 'package:meupet/app/repositories/user/user_repository.dart';
import 'package:meupet/app/repositories/user/user_repository_impl.dart';
import 'package:meupet/app/services/user/user_service.dart';
import 'package:meupet/app/services/user/user_service_impl.dart';
import 'package:provider/provider.dart';

import 'app_widget.dart';

class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserRepository>(
            create: (context) =>
                UserRepositoryImpl(iHttpService: context.read())),
        Provider<UserService>(
          create: (context) => UserServiceImpl(userRepository: context.read()),
        )
      ],
      child: const AppWidget(),
    );
  }
}
