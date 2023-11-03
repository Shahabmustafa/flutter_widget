import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:gap/gap.dart';

class PasswordValidation extends StatefulWidget {
  const PasswordValidation({Key? key}) : super(key: key);

  @override
  State<PasswordValidation> createState() => _PasswordValidationState();
}

class _PasswordValidationState extends State<PasswordValidation> {
  final Controller = TextEditingController();
  final email = TextEditingController();
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/image1.jpg"),
            Gap(40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Your Email",
                        border: InputBorder.none,
                      ),
                      controller: email,
                    ),
                  ),
                ),
              ),
            ),
            Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      obscureText: visible,
                      decoration: InputDecoration(
                        hintText: "Enter Your Password",
                        border: InputBorder.none,
                        suffixIcon: InkWell(
                          onTap: (){
                            setState(() {
                              visible =! visible;
                            });
                          },
                          child: Icon(visible ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                        ),
                      ),
                      controller: Controller,
                    ),
                  ),
                ),
              ),
            ),
            Gap(20),
            FlutterPwValidator(
              width: 330,
              height: 150,
              minLength: 1,
              lowercaseCharCount: 2,
              numericCharCount: 3,
              specialCharCount: 1,
              onSuccess: (){

                },
                controller: Controller,
            ),
          ],
        ),
      ),
    );
  }
}
