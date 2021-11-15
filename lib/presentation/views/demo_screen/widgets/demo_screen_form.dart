import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tonal_mobile_coding_challenge/logic/metrics/metrics_cubit.dart';
import 'package:tonal_mobile_coding_challenge/presentation/constants/styles.dart';

// This is our form that contains two input fields, one for our label and another
// for weight. We validate our user input and pass the data to our Metrics Cubit
// which updates our state based on the new data. If this was a production app
// we would ideally make the form its own cubit or bloc.
class DemoScreenForm extends StatefulWidget {
  const DemoScreenForm({Key? key}) : super(key: key);

  @override
  _DemoScreenFormState createState() => _DemoScreenFormState();
}

class _DemoScreenFormState extends State<DemoScreenForm> {
  final _formKey = GlobalKey<FormState>();
  late String _label;
  late int _weight;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: screenHeight * .04),
            width: screenWidth * .8,
            child: TextFormField(
              decoration: labelFieldStyle,
              // We limit our label field to 16 chars or else it may leave the bounds
              // of our circular metric widget's available space.
              inputFormatters: [
                LengthLimitingTextInputFormatter(16),
                FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s")),
              ],
              // Our label field cannot be empty.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Field must not be empty.';
                }
              },
              onSaved: (value) {
                _label = value!;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: screenHeight * .04),
            width: screenWidth * .8,
            child: TextFormField(
              decoration: weightFieldStyle,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3),
              ],
              // Our weight field must not be empty and we also make sure that the
              // value is not more then 350 per specifications.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Field must not be empty.';
                }
                if (int.parse(value) > 350) {
                  return 'Weight cannot be greater than 350.';
                }
              },
              onSaved: (value) {
                _weight = int.parse(value!);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: screenHeight * .04),
            width: screenWidth * .45,
            height: screenHeight * .06,
            child: ElevatedButton(
              child: Text(
                'Update Metrics',
                style: labelTextStyle,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff53a99a)),
                shadowColor: MaterialStateProperty.all(Color(0x3827ae96)),
                elevation: MaterialStateProperty.all(7.0),
              ),
              // We use our Elevated Button's onPressed function to validate our saved
              // form data and to then pass the data to our Metrics Cubit via BlocProvider.
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  BlocProvider.of<MetricsCubit>(context)
                      .updateMetrics(_label, _weight);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
