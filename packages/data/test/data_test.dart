import 'package:data/api/api_state.dart';
import 'package:data/api/reservation.api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var reservationApi = ReservationApi();

  test('sunday default instance', () async {
    var sundayApi = await reservationApi.getSunday();
    expect(sundayApi is ApiSuccessState, true);
  });

  test('basic default instance', () async {
    var basicApi = await reservationApi.getBasic();
    expect(basicApi is ApiSuccessState, true);
  });

  test('date default instance', () async {
    var date = await reservationApi.getDateList();
    expect(date is ApiSuccessState, true);
  });
}
