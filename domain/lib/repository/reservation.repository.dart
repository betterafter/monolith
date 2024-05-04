import 'package:domain/entity/date.entity.dart';

import '../entity/product.entity.dart';

abstract class ReservationRepository {
  List<DateEntity> getDateList();

  List<ProductEntity> getReservationInfo({
    bool? isSunday = false,
});
}