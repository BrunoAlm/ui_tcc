import 'package:flutter_modular/flutter_modular.dart';
import 'package:uitcc/app/ui/pages/register/register_page.dart';
import 'package:uitcc/app/ui/controllers/register_store.dart';

class RegisterModule extends Module {
  @override
  List<Bind> get binds => [Bind.factory((i) => RegisterStore(i()))];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const RegisterPage()),
      ];
}
