import 'package:firebaseapp/widgets/custom_button.dart';
import 'package:firebaseapp/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static String routeName = '/ForgetPasswordScreen';
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  final  _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                "assets/icon-image.png",
                height: 150,
              ),
              const Text(
                "Enter your email to reset your password",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _key,
                child: CustomTextField(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Please enter email";
                    } else {
                      return null;
                    }
                  },
                  controller: emailController,
                  hintText: "Enter email",
                  labelText: "Email",
                  prefixIconData: Icons.email,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

                    CustomButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          // Logic

                        }
                      },
                      title: "Forget Password",
                    ),

            ],
          ),
      ),
    );
  }
}
