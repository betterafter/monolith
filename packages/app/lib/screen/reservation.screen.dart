
import 'package:app/bloc/date_selection.bloc.dart';
import 'package:app/screen/date_selection.widget.dart';
import 'package:app/screen/time_selection.widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DateSelectionBloc>(
          create: (context) => GetIt.instance(),
        ),
      ],
      child: const MaterialApp(
        home: Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DateSelectionWidget(),
              Expanded(child: TimeSelectionWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
