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
    log('[keykat] get: ${_reservationUsecase}');
  }

  @override
  Widget build(BuildContext context) {

    return const Placeholder();
  }
}
