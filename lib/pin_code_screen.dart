// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  const PinCodeVerificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset('assets/images/pin_banner@2x.png'),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Pin Number Verification',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
              child: RichText(
                text: const TextSpan(
                    text:
                        "A pin code has been given to you.\nPlease enther that pin below.",
                    style: TextStyle(color: Colors.black54, fontSize: 14)),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: formKey,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 5,
                    obscureText: true,
                    obscuringCharacter: '*',
                    obscuringWidget: const FlutterLogo(
                      size: 24,
                    ),
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v!.length < 3) {
                        return "I'm from validator";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    onChanged: (value) {
                      debugPrint(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");

                      return true;
                    },
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                hasError ? "*Please fill up all the cells properly" : "",
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 14,
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
              decoration: BoxDecoration(
                color: const Color(0xff07143F),
                borderRadius: BorderRadius.circular(5),
              ),
              child: ButtonTheme(
                height: 50,
                child: TextButton(
                  onPressed: () {
                    formKey.currentState!.validate();

                    if (currentText.length != 5 || currentText != "12345") {
                      errorController!.add(ErrorAnimationType.shake);
                      setState(() => hasError = true);
                    } else {
                      setState(
                        () {
                          hasError = false;
                          snackBar("OTP Verified!!");
                          Navigator.of(context).pushNamed('/homeScreen');
                        },
                      );
                    }
                  },
                  child: const Center(
                      child: Text(
                    "Verify",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                    child: TextButton(
                  child: const Text("Clear"),
                  onPressed: () {
                    textEditingController.clear();
                  },
                )),
                Flexible(
                    child: TextButton(
                  child: const Text("Set Text"),
                  onPressed: () {
                    setState(() {
                      textEditingController.text = "123456";
                    });
                  },
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
