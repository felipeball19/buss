// login_screen.dart

import 'package:bus_app/screens/bus.dart';
import 'package:bus_app/screens/bus_info_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final String correctPassword = "1234";
  final List<Bus>? buses;

  LoginScreen({this.buses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ingrese la contraseña:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            PasswordForm(correctPassword: correctPassword, buses: buses),
          ],
        ),
      ),
    );
  }
}

class PasswordForm extends StatefulWidget {
  final String correctPassword;
  final List<Bus>? buses;

  const PasswordForm({required this.correctPassword, this.buses});

  @override
  _PasswordFormState createState() => _PasswordFormState(buses: buses);
}

class _PasswordFormState extends State<PasswordForm> {
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordError = false;
  final List<Bus>? buses;

  _PasswordFormState({this.buses});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Contraseña',
            errorText: _passwordError ? 'Contraseña incorrecta' : null,
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            if (_passwordController.text == widget.correctPassword) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BusInfoScreen(buses: buses ?? []),
                ),
              );
            } else {
              setState(() {
                _passwordError = true;
              });
            }
          },
          child: Text('Iniciar Sesión'),
        ),
      ],
    );
  }
}
