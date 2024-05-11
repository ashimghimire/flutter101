import 'package:flutter/material.dart';
class PriceRangePicker extends StatelessWidget {
  const PriceRangePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
        activeColor: Colors.black,
        inactiveColor: Colors.black26,
        overlayColor:MaterialStateProperty.all(Colors.black12) ,
        values: RangeValues(3000,8000), max: 10000, divisions: 100,
        onChanged: (RangeValues current){
      print(current);
    });
  }
}
