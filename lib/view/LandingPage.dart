import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/LandingController.dart';
import 'package:untitled1/model/JoggingTimeModel.dart';

import '../model/ExerciseTimeModel.dart';
import '../model/RowModel.dart';
import '../model/RunningTimeModel.dart';

class LandingPage extends GetView<LandingController> {
  LandingPage({Key? key}) : super(key: key);

  final _landingController = Get.put(LandingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sports Reports"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              _landingController.rotateAngle.value = !_landingController.rotateAngle.value;
            },
            icon: const Icon(Icons.screen_rotation),
          ),
        ],
      ),
      body: Obx(
        () => RotatedBox(
          quarterTurns: _landingController.rotateAngle.value ? 1 : 0,
          // child: _body(),
          child: _body2(),
        ),
      ),
    );
  }

  Widget _body2() {
    return ListView(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 20,
            horizontalMargin: 10,
            dividerThickness: 2,
            columns: const <DataColumn>[
              DataColumn(label: Text('Total Info for \nthe WEEK')),
              DataColumn(label: Text('Total (Sun-Sat)')),
              DataColumn(label: Text('Sun')),
              DataColumn(label: Text('Mon')),
              DataColumn(label: Text('Tue')),
              DataColumn(label: Text('Wed')),
              DataColumn(label: Text('The')),
              DataColumn(label: Text('Fri')),
              DataColumn(label: Text('Sat')),
            ],
            rows: <DataRow>[
              DataRow(
                cells: <DataCell>[
                  const DataCell(Text('')),
                  const DataCell(Text('')),
                  DataCell(Text(_landingController.dateFetch())),
                  DataCell(Text(_landingController.dateFetch(addition: 1))),
                  DataCell(Text(_landingController.dateFetch(addition: 2))),
                  DataCell(Text(_landingController.dateFetch(addition: 3))),
                  DataCell(Text(_landingController.dateFetch(addition: 4))),
                  DataCell(Text(_landingController.dateFetch(addition: 5))),
                  DataCell(Text(_landingController.dateFetch(addition: 6))),
                ],
              ),
              _tableRowOne(RunningTimeModel.sampleData, 1),
              _tableRowOne(JoggingTimeModel.sampleData, 2),
              _tableRowOne(ExerciseTimeModel.sampleData, 3),

              //
              _tableRowTwo(_landingController.totalTime),
              //
              _tableRowTwo(_landingController.runningTimeEngagement),
              //
              _tableRowTwo(_landingController.joggingTimeEngagement),
              //
              _tableRowTwo(_landingController.exerciseTimeEngagement),
            ],
          ),
        ),
      ],
    );
  }

  _tableRowOne(dynamic rowModel, int type) {
    int total = rowModel.sunVal + rowModel.monVal + rowModel.tueVal + rowModel.wedVal + rowModel.thuVal + rowModel.friVal + rowModel.satVal;
    switch (type) {
      case 1:
        _landingController.runTotal = total;
        break;
      case 2:
        _landingController.jogTotal = total;
        break;
      case 3:
        _landingController.excTotal = total;
        break;
    }

    _landingController.calculateTotal();

    return DataRow(
      cells: <DataCell>[
        DataCell(Text(rowModel.rowHead)),
        DataCell(Text("$total")),
        DataCell(Text("${rowModel.sunVal}")),
        DataCell(Text("${rowModel.monVal}")),
        DataCell(Text("${rowModel.tueVal}")),
        DataCell(Text("${rowModel.wedVal}")),
        DataCell(Text("${rowModel.thuVal}")),
        DataCell(Text("${rowModel.friVal}")),
        DataCell(Text("${rowModel.satVal}")),
      ],
    );
  }

  _tableRowTwo(RowModel rowModel) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(rowModel.rowHead)),
        DataCell(Text("${rowModel.total}")),
        DataCell(Text("${rowModel.sunVal}")),
        DataCell(Text("${rowModel.monVal}")),
        DataCell(Text("${rowModel.tueVal}")),
        DataCell(Text("${rowModel.wedVal}")),
        DataCell(Text("${rowModel.thuVal}")),
        DataCell(Text("${rowModel.friVal}")),
        DataCell(Text("${rowModel.satVal}")),
      ],
    );
  }
}
