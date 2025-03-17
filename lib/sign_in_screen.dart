import 'package:flutter/material.dart';
import 'package:priyanshi_interview/res/constant/app_color.dart';
import 'package:priyanshi_interview/res/constant/app_images.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  String? useremail;
  String? userpassword;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errorMessage;

  void validateLogin() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        errorMessage = 'Please enter valid email and password.';
      });
    } else if (email == useremail && password == userpassword) {
      Navigator.pushNamed(context, 'HomeScreen');
    } else {
      setState(() {
        errorMessage = 'Invalid email or password.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 134, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 59, right: 59),
                child: Container(
                  height: 0.054 * height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.bluecolor),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 0.300 * width,
                        height: 0.054 * height,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.bluecolor),
                          borderRadius: BorderRadius.circular(60),
                          color: AppColor.bluecolor,
                        ),
                        child: Center(
                          child: Text(
                            'SIGN IN ',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 0.020 * height,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 0.030 * width),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'SignUpScreen');
                        },
                        child: Text(
                          'SIGN UP ',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 0.020 * height,
                            fontWeight: FontWeight.w700,
                            color: AppColor.bluecolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 0.134 * height),
              SizedBox(
                height: 0.034 * height,
                width: double.infinity,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.bluecolor),
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 0.020 * height,
                      fontWeight: FontWeight.w600,
                      color: AppColor.bluecolor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0.048 * height),
              SizedBox(
                height: 0.034 * height,
                width: double.infinity,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.bluecolor),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 0.020 * height,
                      fontWeight: FontWeight.w600,
                      color: AppColor.bluecolor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0.020 * height),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'SignUpScreen');
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 0.020 * height,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.050 * height),
              InkWell(
                onTap: validateLogin,
                child: Padding(
                  padding: const EdgeInsets.only(left: 100, right: 100),
                  child: Container(
                    height: 0.052 * height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.bluecolor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 0.020 * height,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    errorMessage!,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 0.018 * height,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              SizedBox(height: 0.040 * height),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      indent: 60,
                      endIndent: 6,
                      color: AppColor.blackcolor,
                    ),
                  ),
                  Text(
                    'or continue with',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 0.014 * height,
                      fontWeight: FontWeight.w600,
                      color: AppColor.blackcolor,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 6,
                      endIndent: 60,
                      color: AppColor.blackcolor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.030 * height),
              SizedBox(
                width: 0.224 * width,
                height: 0.046 * height,
                child: Image.asset('images/Group 577.png'),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'SignUpScreen');
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontFamily: 'Poppins',
                          fontSize: 0.016 * height,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff6C7CA8),
                        ),
                      ),
                    ],
                    text: ' Don’t have an account?',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 0.016 * height,
                      fontWeight: FontWeight.w700,
                      color: AppColor.blackcolor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0.127 * height),
            ],
          ),
        ),
      ),
    );
  }
}
