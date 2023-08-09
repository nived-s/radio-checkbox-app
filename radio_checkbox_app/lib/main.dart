import 'package:flutter/material.dart';

// fluttertoast package to show toast message when user selects a radio or checkbox
// make sure to run 'flutter pub get' before running the app
import 'package:fluttertoast/fluttertoast.dart';

// main function-> control flow begins here
void main() {
  // calling materailapp
  runApp(const RadioCheckboxApp());
}

// material app class containing theming and home screen
class RadioCheckboxApp extends StatelessWidget {
  // default constructor
  const RadioCheckboxApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title when the app is in recent tab
      title: 'Radio and Checkbox Demo',
      // choose a theme as you like
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const RadioCheckboxDemo(),
    );
  }
}

// main screen or home screen
class RadioCheckboxDemo extends StatefulWidget {
  // default constructor
  const RadioCheckboxDemo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RadioCheckboxDemoState createState() => _RadioCheckboxDemoState();
}

class _RadioCheckboxDemoState extends State<RadioCheckboxDemo> {
  // _selectedRadio will be the default radio btn selected
  String _selectedRadio = 'Male';

  // By default checkbox is set to false showing it is not selected
  bool _isChecked = false;

  // function to show toast message
  // it gets called every time when the user click on either radio or checkbox btn
  void _showToast(String message) {
    // showToast is a method from fluttertoast package that was imported
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG, // short or long
      gravity: ToastGravity.BOTTOM, // location of toast message
      backgroundColor: Colors.grey[800],
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio and Checkbox Demo'),
      ),
      body: Center(
        child: Column(
          // parent column
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              // child row contains radio btn and label
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // radio btn have 3 required arguments(value, groupvalue, onchanged)
                // 1) male radio
                Radio(
                  value: 'Male',
                  // if there are multiple radio buttons in a single screen, groupValue is used to distinguish and group each radio button
                  groupValue: _selectedRadio,
                  // value gets passed whn the usr clicks on the radio
                  onChanged: (value) {
                    setState(() {
                      // selected radio btn is updated
                      _selectedRadio = value!;
                      // function to display toast message is called
                      _showToast('Selected: $_selectedRadio');
                    });
                  },
                ),
                // label for the radio
                const Text('Male'),
                // 2) female radio
                Radio(
                  value: 'Female',
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadio = value!;
                      _showToast('Selected: $_selectedRadio');
                    });
                  },
                ),
                const Text('Female'),
              ],
            ),
            // sizedbox for leaving space between childrens
            const SizedBox(
              height: 40,
            ),
            // Checkbox design
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _isChecked,
                  // when the user click on checkbox
                  onChanged: (value) {
                    // updating ui state to show toast message
                    setState(
                      () {
                        _isChecked = value!;
                        // calling toast message
                        _showToast('Checkbox: $_isChecked');
                      },
                    );
                  },
                ),
                // label for checkbox
                const Text(
                  'I agree to terms and conditions',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
