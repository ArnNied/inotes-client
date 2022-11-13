import 'package:flutter/material.dart';
import 'package:inotes/components/shared/textfield.dart';

class ChangeUsernameSection extends StatefulWidget {
  const ChangeUsernameSection({super.key});

  @override
  State<ChangeUsernameSection> createState() => _ChangeUsernameSectionState();
}

class _ChangeUsernameSectionState extends State<ChangeUsernameSection> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text("Basic Information",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
            ),
            Container(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: null,
                    child: Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: CustomTextField(
                          controller: _firstNameController, 
                          label: 'First Name', 
                          validator: (thisFirstName)
                          {
                            // if (thisFirstName!.isEmpty || thisFirstName.length < 2) {
                            //   return 'Please enter your first name';
                            // }
                          },
                          prefixIcon: Icons.person,
                        )
                      ),
                    ),
                  ),
                  Container(
                    width: null,
                    child: Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: CustomTextField(
                          controller: _lastNameController, 
                          label: 'Last Name', 
                          validator: (thisFirstName)
                          {
                            if (_firstNameController == null || _firstNameController.text.isEmpty) {
                              return "Tidak boleh hanya mengisi Nama Belakang";
                            }
                          },
                          prefixIcon: Icons.person,
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: null,
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: EmailField(
                controller: _emailController,
                // validator: (thisEmail)
                // {
                //   //validasi email
                //   Pattern pattern =
                //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                //   RegExp regex = RegExp(pattern.toString());
                //   if (thisEmail!.length != 0) {
                //     if (!regex.hasMatch(thisEmail)) {
                //       return "Email tidak valid";
                //       }
                //   }
                // },
              )
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    var validate = _formKey.currentState?.validate();
                    if (validate == true) {
                      // _onLoginButtonClick();
                      print(validate);
                    }
                  },
                  child: const Text("Update Basic Information"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
