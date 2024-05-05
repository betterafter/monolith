import 'package:flutter/cupertino.dart';

import '../bloc/date_selection.state.dart';
import '../component/MLColor.dart';

class ProductOrderBottomSheet extends StatefulWidget {
  final SelectNextButtonState state;

  const ProductOrderBottomSheet({super.key, required this.state});

  @override
  State<ProductOrderBottomSheet> createState() =>
      _ProductOrderBottomSheetState();
}

class _ProductOrderBottomSheetState extends State<ProductOrderBottomSheet> {
  late SelectNextButtonState state;

  @override
  void initState() {
    super.initState();
    state = widget.state;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '상품명',
                style: TextStyle(
                  color: MLColor.mlSecondaryGrayColor,
                ),
              ),
              Column(
                children: [
                  Text(
                    '${state.productName} ${state.productDisplayName?.replaceAll('\\n', '\n')}',
                    textAlign: TextAlign.right,
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '날짜시간',
                style: TextStyle(
                  color: MLColor.mlSecondaryGrayColor,
                ),
              ),
              Text('${state.date}')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '구매인원',
                style: TextStyle(
                  color: MLColor.mlSecondaryGrayColor,
                ),
              ),
              Text('${state.riderCount}명')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '총합계',
                style: TextStyle(
                    color: MLColor.mlPrimaryColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w900),
              ),
              Text(
                '${state.ticketPrice}원',
                style: const TextStyle(
                    color: MLColor.mlPrimaryColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w900),
              )
            ],
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: MLColor.mlBlue,
                  borderRadius: BorderRadius.circular(50)),
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
            ),
          )
        ],
      ),
    );
  }
}
