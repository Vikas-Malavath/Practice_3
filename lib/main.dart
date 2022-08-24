import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Finurja Registration'),
          backgroundColor: Colors.amber[600],
          centerTitle: true,
        ),
        body: RegistrationForm(),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  RegistrationFormState createState() {
    return RegistrationFormState();
  }
}

class RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState> ();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget> [
          Padding(
            padding: EdgeInsets.fromLTRB(40, 60, 40, 0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Your Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid name';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 60, 40, 0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Your Email Address',
              ),
              validator: ValidationBuilder().email().build(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 60, 40, 0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Your Password',
              ),
              validator: ValidationBuilder().minLength(8).build(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 80),
            child: ElevatedButton(
              onPressed: () {
                if(_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Details Collected')
                      ),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}