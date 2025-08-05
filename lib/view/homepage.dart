import 'package:flutter/material.dart';
import 'package:weather_api_project_practice/core/constants.dart';
import 'package:weather_api_project_practice/controller/fetchdata.dart';
import 'package:weather_api_project_practice/controller/getlocation.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController inputLocation = TextEditingController();

  String location = '';

  void validateLocation() {
    final trimmed = inputLocation.text.trim();
    if (trimmed.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          showCloseIcon: true,
          backgroundColor: Colors.redAccent,
          content: Text(
            'Please enter your location',
            style: TextStyle(color: Colors.white),
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(containerPadding),
          ),
        ),
      );
    } else if (RegExp(r'^[a-zA-Z\s]+$').hasMatch(trimmed)) {
      setState(() {
        location = trimmed;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          showCloseIcon: true,
          backgroundColor: Colors.redAccent,
          content: Text(
            'Please enter only text (no special characters or numericals,)',
            style: TextStyle(color: Colors.white),
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(containerPadding),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: multiColorCardBackground),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: containerPadding,horizontal: containerPadding*2),
                child: TextFormField(
                  controller: inputLocation,
                  decoration: InputDecoration(
                    labelText: "Enter Your Location",
                    hintText: "Salem",
                    prefixIcon: Icon(
                      Icons.location_on_outlined,
                      color: headerBackground,
                      size: 30,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(containerPadding * 4),
                      borderSide: BorderSide(color: headerBackground, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(containerPadding * 4),
                      borderSide: BorderSide(color: headerBackground, width: 4),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(containerPadding/2),
                      child: IconButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          validateLocation();
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: headerBackground,
                          shape: const CircleBorder(),
                        ),
                        icon: Icon(Icons.search, color: Colors.white, size: containerPadding*2.5,),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter any location';
                    }
                    return null;
                  },
                  // onChanged: (value) {
                  //   // Save the value to your model/controller
                  //   print('Saved name: $value');
                  // },
                ),
              ),
              Expanded(
                child: location.isEmpty
                    ? WeatherApi(getlocation)
                    : WeatherApi(location.toLowerCase()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
