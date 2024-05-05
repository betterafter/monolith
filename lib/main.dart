import 'package:app/screen/reservation.screen.dart';
import 'package:flutter/material.dart';
import 'package:monolith/service_locator.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.initializeApp();

  runApp(const ReservationScreen());
}