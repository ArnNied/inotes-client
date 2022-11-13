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
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
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
                          validator: null,
                          prefixIcon: const Icon(Icons.person),
                        )),
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
                          validator: (thisFirstName) {
                            if (_lastNameController.text.isNotEmpty ||
                                _firstNameController.text.isEmpty) {
                              return "Tidak boleh hanya mengisi Nama Belakang";
                            }

                            return null;
                          },
                          prefixIcon: const Icon(Icons.person),
                        )),
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
            ),
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
    );
  }
}
