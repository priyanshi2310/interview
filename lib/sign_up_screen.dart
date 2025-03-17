import 'package:flutter/material.dart';
import 'package:priyanshi_interview/res/constant/app_color.dart';
import 'package:priyanshi_interview/res/constant/app_images.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? errorMessage;

  bool currentvalue = false;

  void validateSignUp() {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      setState(() {
        errorMessage = 'Please fill Email and Password.';
      });
    } else if (!currentvalue) {
      setState(() {
        errorMessage = 'Please agree to the terms and conditions.';
      });
    } else {
      // Navigate to the home screen after a successful signup
      Navigator.pushNamed(context, 'HomeScreen');
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
          image: DecorationImage(image: AssetImage(AppImages.image)),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context, 'SigninScreen');
                          },
                          child: Text(
                            '     SIGN IN ',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 0.020 * height,
                              fontWeight: FontWeight.w700,
                              color: AppColor.bluecolor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 0.015 * width),
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
                            'SIGN UP ',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 0.020 * height,
                              fontWeight: FontWeight.w700,
                              color: AppColor.whitecolor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 0.058 * height),
              SizedBox(
                height: 0.034 * height,
                width: double.infinity,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.bluecolor),
                    ),
                    hintText: 'Name',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 0.020 * height,
                      fontWeight: FontWeight.w600,
                      color: AppColor.bluecolor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0.046 * height),
              SizedBox(
                height: 0.034 * height,
                width: double.infinity,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
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
              SizedBox(height: 0.046 * height),
              SizedBox(
                height: 0.034 * height,
                width: double.infinity,
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
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
              Row(
                children: [
                  Checkbox(
                    activeColor: const Color(0xff6C7CA8),
                    value: currentvalue,
                    onChanged: (value) {
                      setState(() {
                        currentvalue = value!;
                      });
                    },
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Terms & Condition',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontFamily: 'Poppins',
                            fontSize: 0.016 * height,
                            fontWeight: FontWeight.w700,
                            color: AppColor.blackcolor,
                          ),
                        ),
                      ],
                      text: 'Agree With ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 0.016 * height,
                        fontWeight: FontWeight.w700,
                        color: AppColor.blackcolor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.050 * height),
              InkWell(
                onTap: () {
                  validateSignUp();
                  if (errorMessage == null) {
                    Navigator.pushNamed(context, 'HomeScreen');
                  }
                },
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
                        'Sign Up',
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
                  child: Container(
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.red),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.warning, color: Colors.red),
                        Text(
                          errorMessage!,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 0.018 * height,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
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
                  Navigator.pop(context, 'SigninScreen');
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontFamily: 'Poppins',
                          fontSize: 0.016 * height,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff6C7CA8),
                        ),
                      ),
                    ],
                    text: 'Already Have An Account? ',
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
