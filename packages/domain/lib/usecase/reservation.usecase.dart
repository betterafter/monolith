import '../entity/date.entity.dart';
import '../entity/product.entity.dart';
import '../repository/reservation.repository.dart';
import '../translator/reservation_ui.translator.dart';

class ReservationUsecase {
  final ReservationRepository reservationRepository;

  ReservationUsecase(this.reservationRepository);

  Future<List<DateEntity>?> getDateList() async {
    var dateList = await reservationRepository.getDateList();
    return ReservationUiTranslator.dateTranslatedList(dateList);
  }

  Future<ProductEntity?> getReservationInfo({
    required String dateString,
  }) async {
    var isSunday = ReservationUiTranslator.isSunday(dateString);
    var product = await reservationRepository.getReservationInfo(
      dateString: dateString,
      isSunday: isSunday,
    );

    return ReservationUiTranslator.translatedProduct(product);
  }
}
