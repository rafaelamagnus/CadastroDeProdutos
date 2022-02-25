import 'package:cadastroprodutos/app/modules/auth/presenters/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends ModularState<SignupPage, SignupController> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Crie a sua conta'),
          backgroundColor: Colors.blue,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            minimum: const EdgeInsets.only(left: 45, right: 45, top: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildForm(),
                const SizedBox(height: 10),
                // SocialLoginWidget(),
              ],
            ),
          ),
        ),
      );

  Widget _buildForm() => Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Icon(Icons.add_task, size: 80),
              Column(
                children: [
                  Observer(
                    builder: (_) => TextFormField(
                      onChanged: controller.signupStore.setEmail,
                      readOnly: false,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      //validator: InputValidation.validateEmail,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Observer(
                    builder: (_) => TextFormField(
                      onChanged: controller.signupStore.setPassword,
                      obscureText: true,
                      readOnly: false,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.password),
                        labelText: 'Senha',
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Observer(
                builder: (_) => Container(
                  height: 50,
                  alignment: Alignment.center,
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
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: const Text(
                      'Sing Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      controller.registerUser(context);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
