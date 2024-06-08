import 'package:firebaseapp/helper/sized_box_helper.dart';
import 'package:firebaseapp/provider/auth_provider.dart';
import 'package:firebaseapp/screens/forget_password.dart';
import 'package:firebaseapp/widgets/custom_button.dart';
import 'package:firebaseapp/widgets/custom_text_field.dart';
import 'package:firebaseapp/widgets/screen_background_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticationScreen extends StatefulWidget {
  static String routName = "/AuthenticationScreen";
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAuthProvider(),
      child: Consumer<MyAuthProvider>(builder: (context, provider, _) {
        return Scaffold(
            body: ScreenBackGroundWidget(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _key,
              child: ListView(
                children: [
                  Image.asset(
                    "assets/icon-image.png",
                    height: 150,
                  ),
                  SizedBoxHelper.sizedBox20,
                  if (!provider.isLogin)
                    CustomTextField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please enter a username";
                        } else {
                          return null;
                        }
                      },
                      controller: userNameController,
                      hintText: "Enter Your UserName",
                      labelText: "username",
                      prefixIconData: Icons.person,
                    ),
                  SizedBoxHelper.sizedBox20,
                  CustomTextField(
                    validator: (String? value){
                      if(value!.isEmpty){
                        return "Please enter a valid email";
                      }else{
                        return null;
                      }
                    },
                    controller: emailController,
                    hintText: "Enter your email",
                    labelText: "Email",
                    prefixIconData: Icons.email,
                  ),
                  SizedBoxHelper.sizedBox20,
                  CustomTextField(
                    validator: (String? value){
                      if(value!.isEmpty || value.length<8){
                        return " Please enter a valid password";
                      }else{
                        return null;
                      }
                    },
                    controller: passwordController,
                    hintText: "Enter your password",
                    labelText: "Password",
                    prefixIconData: Icons.password,
                    suffixIcon: const Icon(Icons.remove_red_eye),
                  ),
                  SizedBoxHelper.sizedBox20,
                  if (!provider.isLogin)
                    CustomTextField(
                      validator: (String? value){
                        if(value!.isEmpty){
                          return "Please enter a value";
                        } else if(value!= passwordController.text){
                          return "password does not match";
                        }else {
                          return null;
                        }
                      },
                      controller: confirmPasswordController,
                      hintText: "Enter your password again",
                      labelText: "Confirm Password",
                      prefixIconData: Icons.password,
                      suffixIcon: const Icon(Icons.remove_red_eye),
                    ),
                  SizedBoxHelper.sizedBox20,
                  CustomButton(
                      onPressed: () {
                        if(_key.currentState!.validate()){
                          print("Everything is fine");
                          // code for authentication
                        }
                      },
                      title: provider.isLogin ? "Login" : "Register"),
                  MaterialButton(
                    onPressed: () {
                      provider.setIsLogin();
                    },
                    child: Text(provider.isLogin
                        ? "Don't have an account? Register"
                        : "Already have an account? Login"),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(ForgetPasswordScreen.routeName,);
                    },
                    child: const Text(
                      "Forgot Password?",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
      }),
    );
  }
}
