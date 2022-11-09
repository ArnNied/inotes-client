import 'package:flutter/material.dart';
import 'package:inotes/components/shared/textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;

  final TextEditingController _emailController = TextEditingController();

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
                        "We will reset your account's password and send you an email containing the new password. Please change your password after you log in",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 2, 2, 2),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: EmailField(
                        controller: _emailController,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            var validate = _formKey.currentState?.validate();
                            if (validate == true) {
                              // _onResetButtonClick();
                              // print(validate);
                              Navigator.pushNamed(context, "/auth/reset/confirm");
                            }
                          },
                          child: const Text('RESET'),
                        ),
                      ),
                    ),
                    const Divider(
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
                              {Navigator.pushNamed(context, "/auth/login")},
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
                            Navigator.pushNamed(
                              context,
                              '/auth/register',
                            )
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
