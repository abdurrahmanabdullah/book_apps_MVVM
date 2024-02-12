import 'package:book_apps_mvvm/ui/route_navigation.dart';
import 'package:flutter/material.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.amber, // Set the background color to red
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RouteNavigation.registration);
                    },
                    child: const Text('Registration')),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.amber, // Set the background color to red
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Sign In')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
