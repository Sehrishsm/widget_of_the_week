import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
class CountryCodePick extends StatefulWidget {
  const CountryCodePick({Key? key}) : super(key: key);

  @override
  State<CountryCodePick> createState() => _CountryCodePickState();
}

class _CountryCodePickState extends State<CountryCodePick> {

  String countryCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Code Picker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(countryCode.toString()),
          Center(
            child: TextButton(onPressed: (){
                 showCountryPicker(
                     context: context,
                     countryListTheme: CountryListThemeData(

                       textStyle: TextStyle(fontSize: 20),
                       borderRadius: BorderRadius.circular(10),
                       inputDecoration: InputDecoration(
                         hintText: 'Start typing to search',
                         labelText: 'Search',
                       )
                     ),

                     favorite: ['Pk'],
                     onSelect: (Country value){
                    print(value.countryCode.toString());
                    print(value.phoneCode.toString());
                    countryCode = value.phoneCode.toString();
                    setState(() {

                    });
                     }
                 );
            }, child: Text('Tab'),
            ),
          ),
        ],
      ),
    );
  }
}
