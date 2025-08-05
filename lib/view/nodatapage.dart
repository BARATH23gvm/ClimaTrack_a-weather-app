import 'package:flutter/material.dart';
import 'package:weather_api_project_practice/core/constants.dart';

class noDataPage extends StatelessWidget {
  const noDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white,
        elevation: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            containerPadding * 2,
          ),
        ),
        margin: const EdgeInsets.all(containerPadding * 2),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.location_off,
                color: Colors.redAccent,
                size: 50,
              ),
              const SizedBox(height: 16),
              Text(
                "No Location Found",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Please enter a valid location to continue.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    )
    ;
  }
}
