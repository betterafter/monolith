import 'package:domain/entity/date.entity.dart';
import 'package:domain/entity/product.entity.dart';
import 'package:domain/repository/reservation.repository.dart';
import 'package:flutter/foundation.dart';

import '../api/reservation.api.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  var reservationApi = ReservationApi();

  @override
  Future<List<DateEntity>?> getDateList() async {
    try {
      var dateList = await reservationApi.getDateList();
      return dateList?.on(success: (result) async {
        try {
          return await compute((result) {
            var dateList = <DateEntity>[];
            for (var element in (result?['data'] as List<dynamic>)) {
              dateList.add(DateEntity.fromJson(element));
            }

            return dateList;
          }, result);
        } catch (e) {
          print('[keykat] $e');
          return null;
        }
      }, error: (result, exception) {
        return null;
      });
    } on Exception {
      return null;
    }
  }

  @override
  Future<ProductEntity?> getReservationInfo({
    required String dateString,
    bool isSunday = false,
  }) async {
    try {
      var data = isSunday
          ? await reservationApi.getSunday()
          : await reservationApi.getBasic();

      return await data?.on(success: (result) async {
        try {
          return await compute((result) {
            return ProductEntity.fromJson(result?['data']);
          }, result);
        } catch (e) {
          return null;
        }
      }, error: (result, exception) {
        return null;
      });
    } catch (e) {
      return null;
    }
  }
}
