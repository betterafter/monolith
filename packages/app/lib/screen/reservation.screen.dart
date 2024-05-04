import 'dart:developer';

import 'package:domain/usecase/reservation.usecase.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  late ReservationUsecase _reservationUsecase;

  @override
  void initState() {
    super.initState();
    _reservationUsecase = GetIt.instance();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {

      var datalist = await _reservationUsecase.getDateList();
      print(datalist);
    });
  }

  @override
  Widget build(BuildContext context) {

    return const Placeholder();
  }
}
