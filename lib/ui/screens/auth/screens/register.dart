import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/main.dart';
import 'package:bazar/ui/screens/auth/services/AuthStateService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _phoneController;
  TextEditingController _otpController;
  bool _loading, _validateOtp, _validatePhone, _field;

  @override
  void initState() {
    _phoneController = new TextEditingController();
    _otpController = new TextEditingController();
    _loading = false;
    _validateOtp = false;
    _validatePhone = false;
    _field = true;
    _phoneController.addListener(() {
      setState(() {
        _validatePhone = false;
      });
    });
    _otpController.addListener(() {
      setState(() {
        _validateOtp = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _phoneController = new TextEditingController();
    _otpController = new TextEditingController();
    _loading = false;
    _validateOtp = false;
    _validatePhone = false;
    _field = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                  color: White,
                  width: _width,
                  height: _height,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/logo.png'))),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Container(
                            height: 80,
                            width: _width * 0.7,
                            child: (_field) ? _phoneField() : _otpField(),
                          ),
                          SizedBox(
                            height: 110,
                          ),
                          Opacity(
                            opacity: (_field) ? 1.0 : 0.0,
                            child: InkWell(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Already a member?"),
                                  Text(
                                    "  Login",
                                    style: TextStyle(color: Orange),
                                  )
                                ],
                              ),
                              onTap: () {
                                debugPrint(" Login Requested");
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _loading = true;
                              });
                              try {
                                String phone =
                                    _phoneController.text.toString().trim();
                                String otp =
                                    _otpController.text.toString().trim();

                                if (phone != "" && otp != "") {
                                  debugPrint("Register  Requested " +
                                      phone +
                                      " " +
                                      otp);
                                  requestRegister(phone, otp);
                                } else if (phone != "") {
                                  setState(() {
                                    _validatePhone = false;
                                    _loading = false;
                                    _field = false;
                                    _verifyUser("+91" + phone);
                                  });
                                } else
                                  setState(() {
                                    _loading = false;
                                    debugPrint(phone);
                                    if (phone == "")
                                      _validatePhone = true;
                                    else if (otp == "") _validateOtp = true;
                                  });
                              } catch (e) {
                                debugPrint(e);
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 80,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Orange,
                              ),
                              child: Text(
                                (_field) ? "Next" : "Done",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Opacity(
                              opacity: (_field) ? 1.0 : 0.0, child: Text("Or")),
                          SizedBox(
                            height: 20,
                          ),
                          Opacity(
                            opacity: (_field) ? 1.0 : 0.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Sign-In with E-mail"),
                                InkWell(
                                  onTap: () {
                                    debugPrint("G-mail Sign In Requested");
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/google.jpg'))),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),
            Visibility(
              visible: _loading,
              child: Container(
                alignment: Alignment.center,
                width: _width,
                height: _height,
                child: CircularProgressIndicator(
                  backgroundColor: Orange,
                ),
                color: FakeWhite.withOpacity(0.5),
              ),
            )
          ],
        ),
      ),
    );
  }

  void requestRegister(String phone, String otp) async {
    AuthCredential authCredential = PhoneAuthProvider.getCredential(
        verificationId: verificationId, smsCode: otp);
    await AuthStateService().signIn(authCredential).then((value) {
      setState(() {
        if (value) {
          debugPrint("RESTART APP");
          RestartWidget.restartApp(context);
        } else {
          _loading = false;
          _validateOtp = true;
        }
      });
    });
  }

  String verificationId;

  Future<void> _verifyUser(String phone) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: const Duration(seconds: 3),
        verificationCompleted: _verified,
        verificationFailed: _failed,
        codeSent: _codeSent,
        codeAutoRetrievalTimeout: _codeTimeout);
  }

  void _verified(AuthCredential phoneAuthCredential) {
    setState(() {
      _loading = false;
    });
    AuthStateService().signIn(phoneAuthCredential);
    debugPrint("User REGISTERED Successfully");
  }

  void _failed(AuthException error) {
    debugPrint("Error :OTP DID NOT MATCH" + error.message);
  }

  void _codeSent(String verificationId, [int forceResendingToken]) {
    debugPrint(" CODE SENT");
    setState(() {
      this.verificationId = verificationId;
    });
  }

  void _codeTimeout(String verificationId) {
    debugPrint("OTP TIMEOUT");
    this.verificationId = verificationId;
  }

  Widget _phoneField() {
    return TextField(
      controller: _phoneController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Orange),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: LightBlack),
          ),
          prefixText: "+91 ",
          labelStyle: TextStyle(color: LightBlack.withOpacity(0.5)),
          labelText: _validatePhone ? 'Invalid Phone No !' : "Phone no"),
      cursorColor: LightBlack,
    );
  }

  Widget _otpField() {
    return TextField(
      textAlign: TextAlign.center,
      controller: _otpController,
      keyboardType: TextInputType.number,
      maxLength: 6,
      style: TextStyle(letterSpacing: 20),
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Orange),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: LightBlack),
          ),
          labelStyle:
              TextStyle(color: LightBlack.withOpacity(0.5), letterSpacing: 2),
          labelText: _validateOtp ? 'Invalid Otp!' : "Enter OTP here"),
      cursorColor: LightBlack,
    );
  }
}
