import 'package:flutter_bootcamp/src/config/appConfig.dart';
import 'package:intl/intl.dart';

int getEstimateReadTime({required String words}) {
  int wordCount = words.split(' ').length;
  int readTimeInMins = wordCount ~/ averageReadSpeed;
  if (readTimeInMins == 0) {
    return 1;
  } else {
    return readTimeInMins;
  }
}

String getPrettyDate({required DateTime date}) {
  return DateFormat('MMMd').format(date);
}
