import 'package:flutter/material.dart';

class SignUpInterface extends StatefulWidget {
  const SignUpInterface({Key? key}) : super(key: key);

  @override
  State<SignUpInterface> createState() => _SignUpInterfaceState();
}

class _SignUpInterfaceState extends State<SignUpInterface> {
  bool _isViaible = false;
  bool _ispasswordstatus = false;
  bool _hasPasswordOneNumber = false;
  GlobalKey<FormState> _formstate = new GlobalKey<FormState>();

  cret() {
    var formstat = _formstate.currentState;
    if (formstat!.validate()) {}
  }

  onPasswordChanged(String password) {
    final numricRegex = RegExp(r'[0-9]');
    setState(() {
      _ispasswordstatus = false;
      if (password.length >= 8) {
        _ispasswordstatus = true;
      }
      _hasPasswordOneNumber = false;
      if (numricRegex.hasMatch(password)) {
        _hasPasswordOneNumber = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
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
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/5.jpeg"), fit: BoxFit.cover)),
          ),
          ListView(children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.topLeft,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ]),
                ),
                Form(
                    key: _formstate,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (val) {
                              if (val!.length > 30) {
                                return "لا يمكن أن يكون الاسم الاول أكثر من 30 حرف";
                              }
                              if (val.length < 2) {
                                return "لا يمكن أن يكون الاسم الاول أصغر من حرفين";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person_sharp,
                                  color: Color(0xFFfa7f01),
                                ),
                                hoverColor: Colors.white,
                                hintText: "Firstname",
                                border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            validator: (val) {
                              if (val!.length > 30) {
                                return "لا يمكن أن يكون الاسم الثاني أكثر من 30 حرف";
                              }
                              if (val.length < 2) {
                                return "لا يمكن أن يكون الاسم الثاني أصغر من حرفين";
                              }
                              return null;
                            },
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person_sharp,
                                  color: Color(0xFFfa7f01),
                                ),
                                hoverColor: Colors.white,
                                hintText: "Lastname",
                                border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            validator: (val) {
                              if (val!.length > 30) {
                                return "لا يمكن أن يكون الايميل أكثر من 30 حرف";
                              }
                              if (val.length < 10) {
                                return "لا يمكن أن يكون الايميل أصغر من عشرة احرف";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Color(0xFFfa7f01),
                                ),
                                hoverColor: Colors.white,
                                hintText: "Email",
                                border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            validator: (val) {
                              if (val!.length > 30) {
                                return "لا يمكن أن تكون كلمة السر أكثر من 30 حرف";
                              }
                              if (val.length < 2) {
                                return "لا يمكن أن تكون كلمة السر أصغر من 8 أحرف";
                              }
                              return null;
                            },
                            onChanged: (password) {
                              return onPasswordChanged(password);
                            },
                            obscureText: !_isViaible,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Color(0xFFfa7f01),
                                ),
                                hoverColor: Colors.white,
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isViaible = !_isViaible;
                                      });
                                    },
                                    icon: _isViaible
                                        ? const Icon(
                                            Icons.visibility,
                                            color: Colors.black,
                                          )
                                        : const Icon(
                                            Icons.visibility_off,
                                            color: Colors.black26,
                                          )),
                                hintText: "Password",
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 20,
                                ),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 10),
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    )),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: _ispasswordstatus
                              ? Colors.green
                              : null,
                          border: _ispasswordstatus
                              ? Border.all(color: Colors.amber)
                              : Border.all(color: Colors.white70, width: 3),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            color: Color(0xFFDDDDDBFF),
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Contain at least 8 characters"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: _hasPasswordOneNumber ? Colors.green : null,
                          border: _hasPasswordOneNumber
                              ? Border.all(color: Colors.amber)
                              : Border.all(color: Colors.white70, width: 3),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            color: Color(0xFFDDDDDBFF),
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Contain at least 1 number "),
                  ],
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: MaterialButton(
                    onPressed: () {
                      cret();
                    },
                    height: 50,
                    minWidth: double.infinity,
                    color: Color(0xFFfa7f01),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text(
                      "Create Account",
                      style: TextStyle(color: Color(0xFFf3eced)),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 150,
                      child: const Divider(
                        thickness: 2,
                        color: Colors.black,
                        height: 30,
                        indent: 15,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Or Login With",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 150,
                      child: Divider(
                        thickness: 2,
                        color: Colors.black,
                        height: 30,
                        indent: 10,
                        endIndent: 8,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Material(
                        color: Colors.white,
                        borderRadius: const   BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        child: InkWell(
                            onTap: () {},
                            child: Ink.image(
                              image: AssetImage(
                                "images/google.png",
                              ),
                              height: 60,
                              width: 60,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: Material(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        child: InkWell(
                            onTap: () {},
                            child: Ink.image(
                              image: AssetImage(
                                "images/facebook.png",
                              ),
                              height: 60,
                              width: 60,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: Material(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        child: InkWell(
                            onTap: () {},
                            child: Ink.image(
                              image: AssetImage(
                                "images/twitter.png",
                              ),
                              height: 60,
                              width: 60,
                            )),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Row(
                    children: [
                      const Text(
                        "Already signed up?",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                inherit: true,
                                color: Color(0xFFfa7f01),
                                fontSize: 20,
                                textBaseline: TextBaseline.alphabetic),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ]),
        ]),
      );

  }
}
