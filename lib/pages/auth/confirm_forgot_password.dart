import 'package:flutter/material.dart';
import 'package:inotes/components/shared/textfield.dart';

class ConfirmForgotPasswordPage extends StatefulWidget {
  const ConfirmForgotPasswordPage({super.key});

  @override
  State<ConfirmForgotPasswordPage> createState() => _ConfirmForgotPasswordPageState();
}

class _ConfirmForgotPasswordPageState extends State<ConfirmForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;

  final TextEditingController _resetCodeController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 0, 92),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Container(
                width: 350,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: const Text(
                        "iNotes",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 174, 255),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: const Text(
                        "Input the reset code that has been sent to your email address.",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 2, 2, 2),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
                      child: CustomTextField(
                        controller: _resetCodeController, 
                        label: 'Reset Code', 
                        validator: (thisResetCode) {
                          if (thisResetCode!.isEmpty || thisResetCode == null) {
                              return 'Tolong masukan kode reset';
                            }
                          // int lenoutputCode = outputCode.length;
                          if (thisResetCode.length != 6) {
                            return 'Kode tidak valid';
                          }
                          // if (thisResetCode != outputCode) {
                          //   return 'Kode reset tidak sesuai';
                          // }
                        },
                        prefixIcon: Icons.lock_reset,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                      child: PasswordField(
                        controller: _newPasswordController,
                        isHidden: _isHidden,
                        label: 'New Password',
                        onTap: () {
                          setState(() {
                            _isHidden = !_isHidden;
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
                      child: ConfirmPasswordField(
                        controller: _confirmPasswordController,
                        actualPassword: _newPasswordController.text,
                        isHidden: _isHidden,
                        label: 'Confirm Password',
                        onTap: () {
                          setState(() {
                            _isHidden = !_isHidden;
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
                      child: SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            var validate = _formKey.currentState?.validate();
                            if (validate == true) {
                              // _onResetButtonClick();
                            }
                          },
                          child: const Text('RESET PASSWORD'),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                      child: SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context,'/auth/forgot-password');
                          },
                          child: const Text('CANCEL', style: TextStyle(fontWeight: FontWeight.bold),),
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 255, 255, 255),
                            onPrimary: const Color.fromARGB(255, 0, 174, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(width:2, color: Color.fromARGB(255, 0, 174, 255)),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Divider(
                      color: Colors.black,
                      height: 20,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () =>
                              {
                                Navigator.pushNamed(context, "/auth/login")
                              },
                          child: const Text('LOGIN'),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => {
                            Navigator.pushNamed(context,'/auth/register')
                          },
                          child: const Text('REGISTER'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
