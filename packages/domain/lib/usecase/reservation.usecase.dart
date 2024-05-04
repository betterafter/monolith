import '../entity/date.entity.dart';
import '../entity/product.entity.dart';
import '../repository/reservation.repository.dart';

class ReservationUsecase {
  final ReservationRepository reservationRepository;

  ReservationUsecase(this.reservationRepository);

  Future<List<DateEntity>?> getDateList() async {
    var dateList = await reservationRepository.getDateList();
    return dateList;
  }

  Future<ProductEntity?> getReservationInfo({bool isSunday = false}) async {
    var product =
     await reservationRepository.getReservationInfo(isSunday: isSunday);

    return product;
  }
}