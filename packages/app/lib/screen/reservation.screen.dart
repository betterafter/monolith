import 'package:app/bloc/date_selection.bloc.dart';
import 'package:app/bloc/date_selection.state.dart';
import 'package:app/component/MLColor.dart';
import 'package:app/screen/date_selection.widget.dart';
import 'package:app/screen/time_selection.widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'currentInfo.widget.dart';

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
      child: MaterialApp(
        home: Scaffold(
          body: BlocListener<DateSelectionBloc, DateState>(
            listener: (context, state) {},
            child: const Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CurrentInfoWidget(),
                    DateSelectionWidget(),
                    Expanded(child: TimeSelectionWidget()),
                  ],
                ),
              ],
            ),
          ),
          appBar: AppBar(
            toolbarHeight: 80,
            title: const Text('날짜 시간 선택'),
            titleTextStyle: const TextStyle(
              fontSize: 16,
              color: MLColor.mlPrimaryColor,
            ),
            leading: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 20,
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 15),
                child: const Icon(Icons.close_rounded, size: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
