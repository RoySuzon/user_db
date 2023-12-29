import 'package:flutter/material.dart';
import 'package:user_db/services/custome_snakbar.dart';
import 'package:user_db/sign_up/background.dart';
import 'package:user_db/sign_up/ui/steper/steper_one.dart';
import 'package:user_db/widgets/custom_button.dart';
import 'package:user_db/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();

  final _passwordController = TextEditingController();

  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    print('=========================');
    return CustomeBackground(
      // appBar: AppBar(title: Text('Create User'.toUpperCase())),
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: SafeArea(
            // padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/signup.png'),
                    CustomeTextField(
                      prefixIcon: Icons.person,
                      validator: (value) {
                        if (_nameController.text.trim().length < 2) {
                          return "enter vailid name";
                        } else {
                          return null;
                        }
                      },
                      onChange: (value) {
                        setState(() {});
                      },
                      controller: _nameController,
                      hintText: 'Name',
                    ),
                    CustomeTextField(
                      // keys: _formKey,
                      prefixIcon: Icons.email,
                      controller: _emailController,
                      validator: (value) {
                        if (!emailValid.hasMatch(value!.trim())) {
                          return "Write vailid email";
                        }
                        return null;
                      },
                      onChange: (value) {
                        setState(() {});
                      },
                      hintText: 'email',
                    ),
                    CustomeTextField(
                      prefixIcon: Icons.password,
                      // sufixIcon: Icons.visibility,
                      validator: (value) {
                        if (_passwordController.text.trim().length < 6) {
                          return "enter vailid name";
                        } else {
                          return null;
                        }
                      },
                      onChange: (value) {
                        setState(() {});
                      },
                      inputType: TextInputType.visiblePassword,
                      obscureText: true,
                      controller: _passwordController,
                      hintText: 'Password',
                    ),
                    // SizedBox(height: 10),
                    CustomButton(
                      'N E X T'.toUpperCase(),
                      onTap: _nameController.text.trim().length < 2
                          ? null
                          : !emailValid.hasMatch(_emailController.text.trim())
                              ? null
                              : _passwordController.text.trim().length < 6
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SteperOnseScreen(
                                                      email: _emailController
                                                          .text
                                                          .trim(),
                                                      password:
                                                          _passwordController
                                                              .text
                                                              .trim(),
                                                      name: _nameController.text
                                                          .trim(),
                                                    )));
                                        showSnakbar(
                                            'Sucessfully done!', context,
                                            color: Colors.green);
                                      } else {
                                        showSnakbar('Something to going wrong!',
                                            context,
                                            color: Colors.red);
                                      }
                                    },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
