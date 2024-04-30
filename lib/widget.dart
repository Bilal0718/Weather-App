import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class CityPicker extends StatefulWidget {
  final Function(String?) onCityChanged;

  const CityPicker({Key? key, required this.onCityChanged}) : super(key: key);

  @override
  _CityPickerState createState() => _CityPickerState();
}

class _CityPickerState extends State<CityPicker> {
  String countryValue = "";
  String? stateValue = "";
  String? cityValue = "";
  String address = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 200,
      child: Column(
        children: [
          CSCPicker(
            showStates: true,
            showCities: true,
            flagState: CountryFlag.DISABLE,
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            disabledDropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey.shade300,
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            countrySearchPlaceholder: "Country",
            stateSearchPlaceholder: "State",
            citySearchPlaceholder: "City",
            countryDropdownLabel: "Country",
            stateDropdownLabel: "State",
            cityDropdownLabel: "City",
            countryFilter: [
              CscCountry.Pakistan,
              CscCountry.United_States,
              CscCountry.Canada,
              CscCountry.Germany,
              CscCountry.Bangladesh,
              CscCountry.United_Arab_Emirates
            ],
            selectedItemStyle: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
            dropdownHeadingStyle: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            dropdownItemStyle: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
            dropdownDialogRadius: 10.0,
            searchBarRadius: 10.0,
            onCountryChanged: (value) {
              setState(() {
                countryValue = value;
              });
            },
            onStateChanged: (value) {
              setState(() {
                stateValue = value;
              });
            },
            onCityChanged: (value) {
              setState(() {
                cityValue = value;
              });
              widget.onCityChanged(cityValue);
            },
          ),
        ],
      ),
    );
  }
}