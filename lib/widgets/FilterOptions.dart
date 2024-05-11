import 'package:flutter/material.dart';
import 'package:prioritysoft/widgets/RoundedPills.dart';
List<Widget> sortOptions(){
  List<Widget> options=[];
  options.add(const RoundedPills(text: 'Most recent', selected: true));
  options.add(SizedBox(width: 18,));
  options.add(const RoundedPills(text: 'Lowest price', selected: false));
  options.add(SizedBox(width: 18,));
  options.add(const RoundedPills(text: 'Higest price', selected: false));

  return options;
}

List<Widget> genderOptions(){
  List<Widget> options=[];
  options.add(const RoundedPills(text: 'Man', selected: true));
  options.add(const SizedBox(width: 18,));
  options.add(const RoundedPills(text: 'Woman', selected: false));
  options.add(const SizedBox(width: 18,));
  options.add(const RoundedPills(text: 'Unisex', selected: false));
  return options;
}

List<Widget> colorOptions(){
  List<Widget> options=[];
  options.add(const RoundedPills(text: 'Black', selected: false));
  options.add(const SizedBox(width: 18,));
  options.add(const RoundedPills(text: 'White', selected: true));
  options.add(const SizedBox(width: 18,));
  options.add(const RoundedPills(text: 'Red', selected: false));
  return options;
}
