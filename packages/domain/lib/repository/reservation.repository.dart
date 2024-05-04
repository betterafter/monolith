import 'package:domain/entity/date.entity.dart';

import '../entity/product.entity.dart';

abstract class ReservationRepository {
  Future<List<DateEntity>?> getDateList();

  List<ProductEntity> getReservationInfo({
    bool? isSunday = false,
});
}