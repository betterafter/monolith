import 'package:app/bloc/date_selection.bloc.dart';
import 'package:app/bloc/date_selection.state.dart';
import 'package:app/component/MLColor.dart';
import 'package:domain/entity/date.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import 'package:app/screen/reservation.extension.dart';

import '../bloc/date_selection.event.dart';

class DateSelectionWidget extends StatefulWidget {
  const DateSelectionWidget({super.key});

  @override
  State<DateSelectionWidget> createState() => _DateSelectionWidgetState();
}

class _DateSelectionWidgetState extends State<DateSelectionWidget> {
  final ValueNotifier<int> _todayIndex = ValueNotifier(0);
  final ValueNotifier<bool> _isScrolling = ValueNotifier(false);
  late ScrollController _scrollController;

  late double _dateItemWidth;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    context.read<DateSelectionBloc>().add(DateInitEvent());
  }

  void _animateScrollController() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController
          .animateTo(
            _todayIndex.value * _dateItemWidth,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          )
          .whenComplete(() => _isScrolling.value = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    _dateItemWidth = MediaQuery.of(context).size.width / 6;
    return BlocBuilder<DateSelectionBloc, DateState>(
      buildWhen: (previous, current) {
        return current is DateInitialState;
      },
      builder: (context, state) {
        var dateList = <Widget>[];

        if (state is DateInitialState) {
          _todayIndex.value = state.todayIndex ?? 0;
          context.read<DateSelectionBloc>().add(
            DateSelectEvent(
              state.dateList?[_todayIndex.value].date ?? '',
              selectedIndex: _todayIndex.value,
            ),
          );
          _animateScrollController();
          dateList.addAll(_dateWidgetList(state.dateList ?? []));
        }

        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Column(
            children: [
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: _isScrolling,
                  builder: (context, scroll, child) {
                    return IgnorePointer(
                      ignoring: scroll,
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [...dateList],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _dateWidgetList(List<DateEntity> list) {
    return list.mapIndexed((mapIndex, date) {
      return ValueListenableBuilder(
        valueListenable: _todayIndex,
        builder: (context, index, child) {
          var isSelected = mapIndex == index;

          return Container(
            width: _dateItemWidth,
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(date.monthString ?? ''),
                const Padding(padding: EdgeInsets.only(top: 10)),
                GestureDetector(
                  onTap: () {
                    _todayIndex.value = mapIndex;
                    _isScrolling.value = true;
                    _animateScrollController();
                    context.read<DateSelectionBloc>().add(
                          DateSelectEvent(
                            date.date ?? '',
                            selectedIndex: mapIndex,
                          ),
                        );
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: isSelected
                        ? const BoxDecoration(
                            color: MLColor.mlBlue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          )
                        : const BoxDecoration(
                            color: Colors.transparent,
                          ),
                    child: Text(
                      date.dayString ?? '',
                      style: isSelected
                          ? const TextStyle().selectedDayStyle()
                          : const TextStyle().unSelectedDayStyle(date.isSunday),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 5)),
                Text(
                  date.dayOfWeek ?? '',
                  style: isSelected
                      ? const TextStyle().selectedWeekStyle()
                      : const TextStyle()
                          .unSelectedWeekStyle(date.isToday, date.isSunday),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      );
    }).toList();
  }
}
