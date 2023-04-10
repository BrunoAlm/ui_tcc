import 'package:flutter_modular/flutter_modular.dart';
import 'package:uitcc/app/pages/home/home_module.dart';
import 'package:uitcc/app/pages/login/store/login_store.dart';
import 'package:uitcc/app/pages/recover_password/recover_password_module.dart';
import 'package:uitcc/app/pages/register/register_module.dart';
import 'login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [Bind.factory((i) => LoginStore(i()))];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const LoginPage()),
        ModuleRoute('/register', module: RegisterModule()),
        ModuleRoute('/recover-password', module: RecoverPasswordModule()),
        ModuleRoute('/home', module: HomeModule())
      ];
}