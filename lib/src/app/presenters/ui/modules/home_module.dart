import 'package:flutter_modular/flutter_modular.dart';
import 'package:uitcc/src/app/presenters/ui/templates/register_equipments_page.dart';
// import 'package:uitcc/app/ui/pages/home/cadastrar_dados/cadastrar_dados_screen.dart';
import 'package:uitcc/src/app/presenters/ui/pages/home/home_page.dart';
import 'package:uitcc/src/app/presenters/controllers/equipments_controller.dart';
import 'package:uitcc/src/app/presenters/controllers/home_store.dart';
import 'package:uitcc/src/core/services/appwrite_constants.dart';
import 'package:uitcc/src/app/data/datasources/appwrite_db.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => AppwriteDB(
            i(), databaseId, equipmentsCollectionId, userPrefsCollectionId)),
        Bind.singleton((i) => EquipmentsController(i())),
        Bind.singleton((i) => HomeStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute(
          '/register-equipments/',
          child: (context, args) => const RegisterEquipments(),
        ),
        // ChildRoute('/cadastrar-dados',
        //     child: (context, args) => const CadastrarDadosScreen()),
      ];
}
