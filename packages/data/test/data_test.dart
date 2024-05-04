import 'package:data/api/api_state.dart';
import 'package:data/api/reservation.api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var reservationApi = ReservationApi();

  test('sunday default instance', () async {
    var sundayApi = await reservationApi.getSundayApi();
    expect(sundayApi is ApiSuccess, true);
  });

  test('basic default instance', () async {
    var basicApi = await reservationApi.getBasicApi();
    expect(basicApi is ApiSuccess, true);
  });

  test('date default instance', () async {
    var date = await reservationApi.getDateApi();
    expect(date is ApiSuccess, true);
  });
}
