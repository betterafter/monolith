import 'package:app/component/MLColor.dart';
import 'package:app/screen/reservation.extension.dart';
import 'package:collection/collection.dart';

import 'package:app/bloc/date_selection.bloc.dart';
import 'package:app/bloc/date_selection.state.dart';
import 'package:domain/entity/product.entity.dart';
import 'package:domain/entity/time_list.entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeSelectionWidget extends StatefulWidget {
  const TimeSelectionWidget({super.key});

  @override
  State<TimeSelectionWidget> createState() => _TimeSelectionWidgetState();
}

class _TimeSelectionWidgetState extends State<TimeSelectionWidget> {
  final ValueNotifier<int?> _selectedIndex = ValueNotifier(null);
  final _colorMap = {
    '매진': MLColor.mlSoldOutTextColor,
    '여유': MLColor.mlEnableColor,
    '보통': MLColor.mlNormalColor,
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateSelectionBloc, DateState>(
      builder: (BuildContext context, DateState state) {
        var itemList = <Widget>[];
        if (state is DateSelectedState) {
          itemList.addAll(_itemList(state.timeList ?? []));
        }

        return Padding(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
          child: GridView.builder(
            itemCount: itemList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (BuildContext context, int index) {
              return itemList[index];
            },
          ),
        );
      },
    );
  }

  List<Widget> _itemList(List<TimeListEntity> itemList) {
    return itemList.mapIndexed((mapIndex, timeItem) {
      print('[keykat] item: $timeItem');
      return ValueListenableBuilder(
        valueListenable: _selectedIndex,
        builder: (context, index, child) {
          var selected = index == mapIndex;
          var soldOut = timeItem.soldOut;

          return GestureDetector(
            onTap: () {
              if (soldOut == true) {
                return;
              }

              _selectedIndex.value = mapIndex;
            },
            child: AnimatedContainer(
              width: 100,
              height: 20,
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                color: soldOut == true
                    ? MLColor.mlPrimaryGrayColor
                    : selected
                        ? MLColor.mlBlue
                        : Colors.transparent,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                border: Border.all(
                  width: 1.5,
                  color: MLColor.mlPrimaryGrayColor,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    timeItem.timeSlot ?? '',
                    style: selected
                        ? const TextStyle().selectedTimeStyle()
                        : const TextStyle().unSelectedTimeStyle(soldOut),
                  ),
                  Text(
                    timeItem.stockStatusStr ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: _colorMap[timeItem.stockStatusStr],
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }).toList();
  }
}
