import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/ExerciseTimeModel.dart';
import '../model/JoggingTimeModel.dart';
import '../model/RowModel.dart';
import '../model/RunningTimeModel.dart';

class LandingController extends GetxController {
  int runTotal = 0, jogTotal = 0, excTotal = 0;
  late RowModel totalTime, runningTimeEngagement, joggingTimeEngagement, exerciseTimeEngagement;
  var rotateAngle = false.obs;

  @override
  void onInit() {
    super.onInit();
    totalTime = RowModel(
      rowHead: "Running Time\n engagement % \n(Running / Total Time)",
      total: 0,
      sunVal: RunningTimeModel.sampleData.sunVal + JoggingTimeModel.sampleData.sunVal + ExerciseTimeModel.sampleData.sunVal,
      monVal: RunningTimeModel.sampleData.monVal + JoggingTimeModel.sampleData.monVal + ExerciseTimeModel.sampleData.monVal,
      tueVal: RunningTimeModel.sampleData.tueVal + JoggingTimeModel.sampleData.tueVal + ExerciseTimeModel.sampleData.tueVal,
      wedVal: RunningTimeModel.sampleData.wedVal + JoggingTimeModel.sampleData.wedVal + ExerciseTimeModel.sampleData.wedVal,
      thuVal: RunningTimeModel.sampleData.thuVal + JoggingTimeModel.sampleData.thuVal + ExerciseTimeModel.sampleData.thuVal,
      friVal: RunningTimeModel.sampleData.friVal + JoggingTimeModel.sampleData.friVal + ExerciseTimeModel.sampleData.friVal,
      satVal: RunningTimeModel.sampleData.satVal + JoggingTimeModel.sampleData.satVal + ExerciseTimeModel.sampleData.satVal,
    );
    runningTimeEngagement = RowModel(
      rowHead: "Running Time \nengagement % \n(Running / Total Time)",
      total: calculatePercentage(value: runTotal, totalValue: totalTime.total),
      sunVal: calculatePercentage(value: RunningTimeModel.sampleData.sunVal, totalValue: totalTime.sunVal),
      monVal: calculatePercentage(value: RunningTimeModel.sampleData.monVal, totalValue: totalTime.monVal),
      tueVal: calculatePercentage(value: RunningTimeModel.sampleData.tueVal, totalValue: totalTime.tueVal),
      wedVal: calculatePercentage(value: RunningTimeModel.sampleData.wedVal, totalValue: totalTime.wedVal),
      thuVal: calculatePercentage(value: RunningTimeModel.sampleData.thuVal, totalValue: totalTime.thuVal),
      friVal: calculatePercentage(value: RunningTimeModel.sampleData.friVal, totalValue: totalTime.friVal),
      satVal: calculatePercentage(value: RunningTimeModel.sampleData.satVal, totalValue: totalTime.satVal),
    );
    joggingTimeEngagement = RowModel(
      rowHead: "Jogging Time \nengagement % \n(Jogging / Total Time)",
      total: calculatePercentage(value: jogTotal, totalValue: totalTime.total),
      sunVal: calculatePercentage(value: JoggingTimeModel.sampleData.sunVal, totalValue: totalTime.sunVal),
      monVal: calculatePercentage(value: JoggingTimeModel.sampleData.monVal, totalValue: totalTime.monVal),
      tueVal: calculatePercentage(value: JoggingTimeModel.sampleData.tueVal, totalValue: totalTime.tueVal),
      wedVal: calculatePercentage(value: JoggingTimeModel.sampleData.wedVal, totalValue: totalTime.wedVal),
      thuVal: calculatePercentage(value: JoggingTimeModel.sampleData.thuVal, totalValue: totalTime.thuVal),
      friVal: calculatePercentage(value: JoggingTimeModel.sampleData.friVal, totalValue: totalTime.friVal),
      satVal: calculatePercentage(value: JoggingTimeModel.sampleData.satVal, totalValue: totalTime.satVal),
    );
    exerciseTimeEngagement = RowModel(
      rowHead: "Exercise Time\n engagement % \n(Exercise / Total Time)",
      total: calculatePercentage(value: excTotal, totalValue: totalTime.total),
      sunVal: calculatePercentage(value: ExerciseTimeModel.sampleData.sunVal, totalValue: totalTime.sunVal),
      monVal: calculatePercentage(value: ExerciseTimeModel.sampleData.monVal, totalValue: totalTime.monVal),
      tueVal: calculatePercentage(value: ExerciseTimeModel.sampleData.tueVal, totalValue: totalTime.tueVal),
      wedVal: calculatePercentage(value: ExerciseTimeModel.sampleData.wedVal, totalValue: totalTime.wedVal),
      thuVal: calculatePercentage(value: ExerciseTimeModel.sampleData.thuVal, totalValue: totalTime.thuVal),
      friVal: calculatePercentage(value: ExerciseTimeModel.sampleData.friVal, totalValue: totalTime.friVal),
      satVal: calculatePercentage(value: ExerciseTimeModel.sampleData.satVal, totalValue: totalTime.satVal),
    );
  }

  calculateTotal() {
    totalTime.total = runTotal + jogTotal + excTotal;
    runningTimeEngagement.total = calculatePercentage(value: runTotal, totalValue: totalTime.total);
    joggingTimeEngagement.total = calculatePercentage(value: jogTotal, totalValue: totalTime.total);
    exerciseTimeEngagement.total = calculatePercentage(value: excTotal, totalValue: totalTime.total);
  }

  calculatePercentage({required value, required totalValue}) {
    try {
      double perVal = value / totalValue * 100;
      return perVal.toInt();
    } catch (e) {
      return 0;
    }
  }

  String dateFetch({int addition = 0}) {
    var date = DateTime(2023, 5, 21 + addition);
    var formatter = DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }
}
