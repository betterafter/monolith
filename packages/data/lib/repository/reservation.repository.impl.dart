import 'package:data/api/api_state.dart';
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
      return dateList?.on(
          success: (result) async {
            try {
              return await compute((result) {
                var dateList = <DateEntity>[];
                for (var element in (result?['data'] as List<dynamic>)) {
                  dateList.add(DateEntity.fromJson(element));
                }

                return dateList;
              }, result);
            } catch (e) {
              return [];
            }
      }, error: (result, exception) {
        return null;
      });
    } on Exception catch (e) {
      return null;
    }
  }

  @override
  List<ProductEntity> getReservationInfo({bool? isSunday = false}) {
    // TODO: implement getReservationInfo
    throw UnimplementedError();
  }

}