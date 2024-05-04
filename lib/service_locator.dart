import 'package:data/repository/reservation.repository.impl.dart';
import 'package:domain/repository/reservation.repository.dart';

import 'package:domain/usecase/reservation.usecase.dart';

import 'package:get_it/get_it.dart';

class ServiceLocator {
  static var di = GetIt.instance;

  static void initializeApp() {
    // repository
    di.registerFactory<ReservationRepository>(
        () => ReservationRepositoryImpl());

    // usecase
    di.registerFactory<ReservationUsecase>(
      () => ReservationUsecase(di()),
    );
  }

  GetIt get() => di();
}
