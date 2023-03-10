import 'package:flutter/material.dart';

class SignUpInterface extends StatefulWidget {
  const SignUpInterface({Key? key}) : super(key: key);

  @override
  State<SignUpInterface> createState() => _SignUpInterfaceState();
}

class _SignUpInterfaceState extends State<SignUpInterface> {
  bool _isVisibility = false;
  bool _ispasswordstatus = false;
  bool _hasPasswordOneNumber = false;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  creat() {
    var formstae = formstate.currentState;
    if (formstae!.validate()) {}
  }

  onpasswordchange(String password) {
    final numberredexp = RegExp(r'[0-9]');
    setState(() {
      _ispasswordstatus = false;
      if (password.length >= 8) {
        _ispasswordstatus = true;
      }

      _hasPasswordOneNumber = false;
      if (numberredexp.hasMatch(password)) {
        _hasPasswordOneNumber = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFfa7f01),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Create Your Account ",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/5.jpeg"), fit: BoxFit.cover)),
        ),
        ListView(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Text(
                    "SignUp",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Form(
                key: formstate,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    TextFormField(
                      validator: (val) {
                        if (val!.length > 30) {
                          return "???? ???????? ???? ???????? ?????????? ?????????? ???????? ???? 30 ??????";
                        }
                        if (val.length < 2) {
                          return "???? ???????? ???? ???????? ?????????? ?????????? ???????? ???? ??????????";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xFFfa7f01),
                          ),
                          hintText: "Firstname",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.length > 30) {
                          return "???? ???????? ???? ???????? ?????????? ???????????? ???????? ???? 30 ??????";
                        }
                        if (val.length < 2) {
                          return "???? ???????? ???? ???????? ?????????? ???????????? ???????? ???? ??????????";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xFFfa7f01),
                          ),
                          hintText: "Lastname",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val!.length > 30) {
                          return "???? ???????? ???? ???????? ??????????????  ???????? ???? 30 ??????";
                        }
                        if (val.length < 15) {
                          return "???? ???????? ???? ???????? ??????????????  ???????? ???? 15 ?????? ";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xFFfa7f01),
                          ),
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.length > 30) {
                          return "???? ???????? ???? ???????? ???????? ???????????? ???????? ???? 30 ??????";
                        }
                        if (val.length < 8) {
                          return "???? ???????? ???? ???????? ???????? ???????????? ???????? ???? 8 ????????";
                        }
                        return null;
                      },
                      onChanged: (password) {
                        return onpasswordchange(password);
                      },
                      obscureText: !_isVisibility,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.password,
                            color: Color(0xFFfa7f01),
                          ),
                          hintText: "Password",
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isVisibility = !_isVisibility;
                                });
                              },
                              icon: _isVisibility
                                  ? Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    )
                                  : Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey,
                                    )),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color: _ispasswordstatus ? Colors.green : null,
                              border: _ispasswordstatus
                                  ? Border.all(color: Colors.amber)
                                  : Border.all(color: Colors.white70),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Contain at least 8 charaeters"),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color:
                                  _hasPasswordOneNumber ? Colors.green : null,
                              border: _hasPasswordOneNumber
                                  ? Border.all(color: Colors.amber)
                                  : Border.all(color: Colors.white70),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Contain at least 1 Number"),
                      ],
                    ),
                  ]),
                )),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MaterialButton(
                onPressed: () {
                  creat();
                },
                height: 50,
                minWidth: double.infinity,
                color: Color(0xFFfa7f01),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "Create Accont",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 150,
                  child: Divider(
                    thickness: 1.2,
                    color: Colors.black,
                    indent: 15,
                    height: 40,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Or Login with",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 150,
                  child: Divider(
                    thickness: 1.2,
                    color: Colors.black,
                    indent: 10,
                    height: 40,
                    endIndent: 8,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5)),
                    child: InkWell(
                      onTap: () {},
                      child: Ink.image(
                        image: AssetImage("images/google.png"),
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5)),
                    child: InkWell(
                      onTap: () {},
                      child: Ink.image(
                        image: AssetImage("images/facebook.png"),
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5)),
                    child: InkWell(
                      onTap: () {},
                      child: Ink.image(
                        image: AssetImage("images/twitter.png"),
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Row(
                children: [
                  Text(
                    "Already signed up?",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Login",
                        style:
                            TextStyle(color: Color(0xFFfa7f01), fontSize: 20),
                      ))
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
