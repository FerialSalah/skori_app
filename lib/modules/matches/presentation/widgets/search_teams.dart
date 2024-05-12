import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  List<String> countriesList = [
    'Pakistan',
    'Afghanistan',
    'America',
    'China',
    'Indonesia'
  ];
  String itemSelected = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: DropdownSearch<String>(
                items: countriesList,
                popupProps: PopupProps.menu(
                  showSearchBox: true,
                ),
                dropdownButtonProps: DropdownButtonProps(color: Colors.blue,),
                dropdownDecoratorProps: DropDownDecoratorProps(
                  textAlignVertical: TextAlignVertical.center,
                  dropdownSearchDecoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
                onChanged: (value) {
                  setState(() {
                    itemSelected = value.toString();
                  });
                },
                selectedItem: itemSelected,
              ),
            )));
  }
}