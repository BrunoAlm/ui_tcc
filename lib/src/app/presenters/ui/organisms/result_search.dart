// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uitcc/src/app/presenters/ui/atom/equipments_raw_list.dart';
import 'package:uitcc/src/app/presenters/controllers/equipments_controller.dart';

class ResultSearch extends StatefulWidget {
  final EquipmentsController equipmentStore;
  const ResultSearch({
    Key? key,
    required this.equipmentStore,
  }) : super(key: key);

  @override
  State<ResultSearch> createState() => _ResultSearchState();
}

class _ResultSearchState extends State<ResultSearch> {
  @override
  Widget build(BuildContext context) {
    List<String> filteredEquipmentsName =
        widget.equipmentStore.filteredEquipmentsName.value;
    return SizedBox(
      height: (50 * filteredEquipmentsName.length.toDouble())
          .clamp(0, 250)
          .toDouble(),
      width: 300,
      child: ListView.builder(
        itemCount: filteredEquipmentsName.length,
        padding: const EdgeInsets.only(bottom: 20),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              filteredEquipmentsName[index],
            ),
            trailing: IconButton(
              onPressed: () {
                widget.equipmentStore.add(
                  name: filteredEquipmentsName[index],
                  qty: 1,
                  time: const TimeOfDay(hour: 00, minute: 00),
                  power: TextEditingController(text: '0'),
                );
                equipmentsRawList.removeWhere(
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
