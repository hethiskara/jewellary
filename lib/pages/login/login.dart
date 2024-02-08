import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewelleryapp/pages/home/home.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 100, right: 150, left: 30),
                    child: Text(
                      'Login to your',
                      style: TextStyle(
                        fontFamily: 'montserrat',
                        fontSize: 36,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 224, left: 30),
                    child: Text(
                      'Account',
                      style: TextStyle(
                        fontFamily: 'montserrat',
                        fontSize: 36,
                        color: Color.fromARGB(255, 176, 38, 38),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 80, left: 30),
                    child: Text(
                      'Please fill your detail to access your account',
                      style: TextStyle(
                        fontFamily: 'montserrat',
                        fontSize: 14,
                        color: Color.fromARGB(189, 70, 70, 70),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  const Padding(
                    padding: EdgeInsets.only(right: 80, left: 30),
                    child: Padding(
                      padding: EdgeInsets.only(right: 170),
                      child: Text(
                        'Username',
                        style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                  EmailInput(econtroller: emailController),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 80, left: 30),
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 170,
                      ),
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                  PasswordInput(pcontroller: passwordController),
                  TextButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.only(left: 242.0),
                      child: Text(
                        'Forget Password',
                        style:
                            TextStyle(color: Color.fromARGB(255, 155, 18, 18)),
                      ),
                    ),
                  ),
                  SizedBox(height: 250),
                  LoginButton(
                    emailController: emailController,
                    passwordController: passwordController,
                    formKey: _formKey,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmailInput extends StatefulWidget {
  const EmailInput({Key? key, required this.econtroller}) : super(key: key);

  final TextEditingController econtroller;

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  get econtroller => widget.econtroller;

  String? validateUsername(String? value) {
    if (value == null || value.length < 4 || value.length > 10) {
      return 'Username must be between 4 to 10 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 35, left: 30),
      child: SizedBox(
        width: 320,
        child: TextFormField(
          onChanged: (value) => print(value),
          controller: econtroller,
          validator: (value) => validateUsername(value),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter your Username',
            prefixIcon: Icon(Icons.mail_outline),
            isCollapsed: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            errorText: validateUsername(econtroller.text),
          ),
        ),
      ),
    );
  }
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({Key? key, required this.pcontroller}) : super(key: key);

  final TextEditingController pcontroller;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true; // Initially password is obscure

  get pcontroller => widget.pcontroller;

  String? validatePassword(String? value) {
    if (value!.length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 35, left: 30),
      child: SizedBox(
        width: 320,
        child: TextFormField(
          onChanged: (value) => print(value),
          controller: pcontroller,
          obscureText: _obscureText, // Use the state to toggle visibility
          validator: (value) => validatePassword(value),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter your Password',
            prefixIcon: Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            isCollapsed: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            errorText: validatePassword(pcontroller.text),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  LoginButton({
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  void login() {
    if (widget.formKey.currentState!.validate()) {
      // Form is valid, proceed with login
      Get.offAll(() => HomePage(username: widget.emailController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => login(),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 155, 18, 18),
          padding:
              const EdgeInsets.only(left: 150, right: 150, top: 15, bottom: 15),
        ),
        child: const Text(
          'Login',
          style: TextStyle(
            fontFamily: 'montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
