// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uitcc/app/pages/home/cadastrar_dados/api/equipments_api.dart';
import 'package:uitcc/app/pages/home/store/equipments_store.dart';
import 'package:uitcc/services/database/appwrite_db.dart';

class ResultSearch extends StatefulWidget {
  final EquipmentsStore equipmentStore;
  const ResultSearch({
    Key? key,
    required this.equipmentStore,
  }) : super(key: key);

  @override
  State<ResultSearch> createState() => _ResultSearchState();
}

class _ResultSearchState extends State<ResultSearch> {
  final AppwriteDB appwriteDB = Modular.get();
  @override
  Widget build(BuildContext context) {
    List<String> filteredEquipmentsName =
        widget.equipmentStore.filteredEquipmentsName.value;
    return SizedBox(
      height: 200,
      width: 300,
      child: ListView.builder(
        itemCount: filteredEquipmentsName.length,
        padding: const EdgeInsets.only(bottom: 20),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              filteredEquipmentsName[index],
              style: const TextStyle(color: Colors.black),
            ),
            trailing: IconButton(
              onPressed: () {
                widget.equipmentStore.add(
                  name: filteredEquipmentsName[index],
                  qty: 1,
                  time: const TimeOfDay(hour: 00, minute: 00),
                  power: TextEditingController(),
                );
                equipmentsApi.removeWhere(
                    (element) => element == filteredEquipmentsName[index]);
                widget.equipmentStore.performSearch();
              },
              icon: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
