import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../component/MLColor.dart';

class CurrentInfoWidget extends StatefulWidget {
  const CurrentInfoWidget({super.key});

  @override
  State<CurrentInfoWidget> createState() => _CurrentInfoWidgetState();
}

class _CurrentInfoWidgetState extends State<CurrentInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _ticketSelectWidget(),
          _dottedLine(),
          _dateSelectionWidget(),
          _dottedLine(),
          _priceSelectionWidget(),
        ],
      ),
    );
  }

  Widget _ticketSelectWidget() {
    return Container(
      width: 90,
      height: 26,
      padding: const EdgeInsets.fromLTRB(0, 2, 4, 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: MLColor.mlBlue,
        borderRadius: BorderRadius.circular(100),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 2),
            child: Icon(
              Icons.check_rounded,
              size: 16,
              color: MLColor.mlWhite,
            ),
          ),
          Text(
            '티켓선택',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: MLColor.mlWhite,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dottedLine() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 4),
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            color: MLColor.mlPrimaryColor,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 4, right: 4),
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            color: MLColor.mlPrimaryColor,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ],
    );
  }

  Widget _dateSelectionWidget() {
    return Container(
      width: 90,
      height: 26,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: const Border(
            top: BorderSide(width: 1.5, color: MLColor.mlBlue),
            bottom: BorderSide(width: 1.5, color: MLColor.mlBlue),
            right: BorderSide(width: 1.5, color: MLColor.mlBlue),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 2),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: MLColor.mlBlue,
            ),
            child: const Icon(
              Icons.calendar_today_outlined,
              size: 14,
              color: MLColor.mlWhite,
            ),
          ),
          const Text(
            '시간선택',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: MLColor.mlBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceSelectionWidget() {
    return Container(
      width: 90,
      height: 26,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: const Border(
            top: BorderSide(width: 1.5, color: MLColor.mlPrimaryGrayColor),
            bottom: BorderSide(width: 1.5, color: MLColor.mlPrimaryGrayColor),
            right: BorderSide(width: 1.5, color: MLColor.mlPrimaryGrayColor),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 2),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: MLColor.mlPrimaryGrayColor,
            ),
            child: const Icon(
              Icons.calendar_today_outlined,
              size: 14,
              color: MLColor.mlWhite,
            ),
          ),
          const Text(
            '결제하기',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: MLColor.mlPrimaryGrayColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
