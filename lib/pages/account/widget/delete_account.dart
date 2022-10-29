import 'package:flutter/material.dart';
import 'package:inotes/components/common/appbar.dart';
// import 'package:inotes/pages/account/widget/warning_delete_account.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 15, left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Account Deletion", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("By clicking this button you acknowledged that every single data concerning you (this includes notes, email, password, and full name) will be deleted permanently and cannot be reversed.", style: TextStyle(fontSize: 15)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, right: 10, left: 10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => {
                    warningDelete()}, 
                  child: Text("DELETE MY ACCOUNT"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(153, 255, 0, 0),
                ),
               ),
             ),
            ),
          ],
        ),
    );
  }

  void warningDelete() {

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Are you Sure?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
      content: Text("This is the final step of your account deletion. This action is permanent and irreversible."),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
          crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    child: Text("CANCEL", style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed:  () {Navigator.pop(context);},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(153, 255, 0, 0),),
                    
                  ),
                ),
              ),
            ),
            Expanded(
              child:Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    child: Text("CONFIRM", style: TextStyle(color: Color.fromARGB(255, 255, 0, 0), fontWeight: FontWeight.bold)),
                    onPressed:  () {Navigator.pop(context);},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      side: BorderSide(width: 2.0, color: Color.fromARGB(153, 255, 0, 0)),
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
    showDialog(context: context,builder: (BuildContext context) {return alert;},
    );
  }
}
