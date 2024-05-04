import 'dart:convert';

import 'package:data/api/api_state.dart';
import 'package:data/dto/date.dto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class ReservationApi {
  Future<ApiState<Map<String, dynamic>>?> getDateList() async {
    var data = await rootBundle.loadString('assets/date.json');
    var dataMap = await compute((message) async {
      var decodedData = await jsonDecode(message) as Map<String, dynamic>;
      return ApiState.success(data: decodedData);
    }, data);

    return dataMap;
  }

  Future<ApiState<Map<String, dynamic>>?> getBasic() async {
    var data = await rootBundle.loadString('assets/basic.json');
    var dataMap = await compute((message) async {
      var decodedData = await jsonDecode(message) as Map<String, dynamic>;
      return ApiState.success(data: decodedData);
    }, data);

    return dataMap;
  }

  Future<ApiState<Map<String, dynamic>>?> getSunday() async {
    var data = await rootBundle.loadString('assets/sunday.json');
    var dataMap = await compute((message) async {
      var decodedData = await jsonDecode(message) as Map<String, dynamic>;
      return ApiState.success(data: decodedData);
    }, data);

    return dataMap;
  }
}