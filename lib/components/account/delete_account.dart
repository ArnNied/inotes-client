import 'package:flutter/material.dart';

class DeleteAccountSection extends StatefulWidget {
  const DeleteAccountSection({super.key});

  @override
  State<DeleteAccountSection> createState() => _DeleteAccountSectionState();
}

class _DeleteAccountSectionState extends State<DeleteAccountSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 30, bottom: 15, left: 10),
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text("Account Deletion",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
          child: const Align(
            alignment: Alignment.topLeft,
            child: Text(
                "By clicking this button you acknowledged that every single data concerning you (this includes notes, email, password, and full name) will be deleted permanently and cannot be reversed.",
                style: TextStyle(fontSize: 15)),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => {warningDelete()},
              child: const Text("DELETE MY ACCOUNT"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(153, 255, 0, 0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void warningDelete() {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Are you Sure?",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
      content: const Text(
          "This is the final step of your account deletion. This action is permanent and irreversible."),
      actions: [
        Row(
          mainAxisAlignment:
              MainAxisAlignment.center, //Center Row contents horizontally,
          crossAxisAlignment:
              CrossAxisAlignment.center, //Center Row contents vertically,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    child: const Text("CANCEL",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(153, 255, 0, 0),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    child: const Text("CONFIRM",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 0, 0),
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      side: const BorderSide(
                          width: 2.0, color: Color.fromARGB(153, 255, 0, 0)),
                      shadowColor: null,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
