import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'auth_controller.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends ModularState<AuthPage, AuthController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(
            'Cadastro de Produtos',
          ),
          backgroundColor: Colors.blue,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 0,
        ),
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 45, right: 45),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 180),
              child: Column(
                children: [
                  _buildAccount(),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildAccount() => Column(
        children: [
          const Icon(Icons.shopping_cart, size: 80),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 50,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                stops: [0.2, 1.1],
                colors: [
                  Color(0xfff58524),
                  Color(0xfff92b7f),
                ],
              ),
            ),
            child: TextButton(
              autofocus: true,
              onPressed: () => {controller.navigateToLoginByEmail()},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: const <Widget>[
                Text(
                  'Login com email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Não tenho uma conta',
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                width: 5,
              ),
              TextButton(
                child: const Text(
                  'Criar a conta',
                  style: TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                onPressed: controller.navigateToSignup,
              )
            ],
          ),
        ],
      );
}
