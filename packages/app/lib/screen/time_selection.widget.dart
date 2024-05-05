import 'package:app/bloc/date_selection.event.dart';
import 'package:app/component/MLColor.dart';
import 'package:app/screen/reservation.extension.dart';
import 'package:collection/collection.dart';

import 'next_bottom.sheet.dart';
import 'package:app/bloc/date_selection.bloc.dart';
import 'package:app/bloc/date_selection.state.dart';
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
    return BlocConsumer<DateSelectionBloc, DateState>(
      listenWhen: (previous, current) {
        return current is SelectNextButtonState || current is DateSelectedState;
      },
      listener: (context, state) {
        if (state is SelectNextButtonState) {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return ProductOrderBottomSheet(state: state);
            },
          );
        } else if (state is DateSelectedState) {
          _selectedIndex.value = null;
        }
      },
      buildWhen: (previous, current) {
        return current is DateSelectedState;
      },
      builder: (BuildContext context, DateState state) {
        var itemList = <Widget>[];
        if (state is DateSelectedState) {
          itemList.addAll(_itemList(state.timeList ?? []));
        }

        return Stack(
          children: [
            Padding(
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
            ),

            /// 다음 버튼
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  if (_selectedIndex.value == null) {
                    return;
                  }

                  context.read<DateSelectionBloc>().add(
                        SelectNextButtonEvent(),
                      );
                },
                child: ValueListenableBuilder(
                  valueListenable: _selectedIndex,
                  builder: (context, selected, child) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: selected != null
                              ? MLColor.mlBlue
                              : MLColor.mlSecondaryGrayColor,
                          borderRadius: BorderRadius.circular(50)),
                      margin: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: const Text(
                        '다음',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: MLColor.mlWhite,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _itemList(List<TimeListEntity> itemList) {
    return itemList.mapIndexed((mapIndex, timeItem) {
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
              context.read<DateSelectionBloc>().add(
                    TimeSelectEvent(timeItem.timeSlot),
                  );
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
