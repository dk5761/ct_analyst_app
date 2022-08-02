import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../common/custom_button.dart';
import '../../../constants/colors.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Dashboard",
                  style: TextStyle(
                      color: darkHeaderTextColor,
                      fontSize: 21,
                      fontWeight: FontWeight.bold),
                ),
              ),
              CustomButton(
                label: "Go To Task Screen",
                onPressed: () => AutoRouter.of(context).pushNamed('main'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
