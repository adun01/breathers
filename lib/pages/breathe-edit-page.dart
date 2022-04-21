import 'package:breather/models/breathes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:breather/models/step-indicator.dart';

import 'package:breather/constants/routes.dart';
import 'package:breather/models/steps-indicator.dart';

class BreatheEditPage extends StatefulWidget {
  BreatheEditPage({Key? key});

  @override
  _BreatheEditPage createState() => _BreatheEditPage();
}

class _BreatheEditPage extends State {
  Widget widgetStep(StepIndicator step) {
    return Column(
      children: [
        Text(step.label),
        TextFormField(
          initialValue: step.time.toString(),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter a search term',
            labelText: 'Enter a search term',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as BreathersShortModel;
    final steps = StepsIndicator.StepsIndicatorMock(args.id);
    return Scaffold(
        body: Form(
            child: Column(
          children: <Widget>[...steps.steps.map((step) => widgetStep(step))],
        )),
        persistentFooterButtons: [
          ElevatedButton(
            onPressed: () {
              // navigatorPushNames(context, RoutesPath.routeBreatherEdit, args);
            },
            child: const Text('save'),
          ),
          ElevatedButton(
            onPressed: () {
              navigatorPushNames(context, RoutesPath.routeBreather, args);
            },
            child: const Text('back'),
          )
        ]);
  }
}
