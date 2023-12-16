import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pencarian_kos/firebase_auth_service.dart';
import 'package:pencarian_kos/home.dart';
import 'package:pencarian_kos/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool rememberUser = false;

  final FirebaseAuthService _authService = FirebaseAuthService();

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void register() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user =
        await _authService.signUpWithEmailandPassword(email, password, context);
    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("User is successfully created"),
        backgroundColor: Colors.green,
      ));
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Cannot create user"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
          image: const AssetImage("assets/icon/Image.png"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(bottom: 0, child: _buildBottom()),
        ]),
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome",
          style: TextStyle(
              color: myColor, fontSize: 32, fontWeight: FontWeight.w500),
        ),
        _buildGreyText("Please sign up with your information"),
        const SizedBox(height: 60),
        _buildGreyText("Email address"),
        _buildInputField(_emailController),
        const SizedBox(height: 40),
        _buildGreyText("Password"),
        _buildInputField(_passwordController, isPassword: true),
        const SizedBox(height: 20),
        //_buildRememberForgot(),
        const SizedBox(height: 20),
        _buildLoginButton(),
        const SizedBox(height: 20),
        _buildOtherRegister(),
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  // Widget _buildRememberForgot() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Row(
  //         children: [
  //           Checkbox(
  //               value: rememberUser,
  //               onChanged: (value) {
  //                 setState(() {
  //                   rememberUser = value!;
  //                 });
  //               }),
  //           _buildGreyText("Remember me"),
  //         ],
  //       ),
  //       TextButton(onPressed: () {}, child: _buildGreyText("forgot password"))
  //     ],
  //   );
  // }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Email : ${_emailController.text}");
        debugPrint("Password : ${_passwordController.text}");
        register();
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: myColor,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text("Sign Up"),
    );
  }

  Widget _buildOtherRegister() {
    return Center(
      child: Column(
        children: [
          _buildGreyText("Already has an account?"),
          const SizedBox(width: 4.0),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              child: const Text(
                "Login.",
                style: TextStyle(color: Colors.deepPurple),
              ))
        ],
      ),
    );
  }
}
