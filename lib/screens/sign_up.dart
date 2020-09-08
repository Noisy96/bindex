import "package:flutter/material.dart";

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // TODO : Refactor this code using expanded widget to get rid of the need to using device height and width
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    final signUpText = Container(
      padding: EdgeInsets.only(left: deviceWidth * 0.1, top: 5, bottom: 5),
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.white, width: 5))),
      child: Text(
        "Sign up",
        style: TextStyle(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );

    final fullName = Container(
      width: deviceWidth * 0.85,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.text,
        autofocus: false,
        style: TextStyle(color: Colors.white, fontSize: 16),    
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.person_outline, color: Colors.white),
            hintText: 'Full name',
            hintStyle: TextStyle(color: Colors.white, fontSize: 16),
            contentPadding: EdgeInsets.fromLTRB(20.0, 13.0, 20.0, 10.0),
            border:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            filled: true,
            fillColor: Colors.white.withOpacity(0.4)),
      ),
    );

    final email = Container(
      width: deviceWidth * 0.85,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        style: TextStyle(color: Colors.white, fontSize: 16),    
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.mail_outline, color: Colors.white),
            hintText: 'Email',
            hintStyle: TextStyle(color: Colors.white, fontSize: 16),
            contentPadding: EdgeInsets.fromLTRB(20.0, 13.0, 20.0, 10.0),
            border:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            filled: true,
            fillColor: Colors.white.withOpacity(0.4)),
      ),
    );

    final password = Container(
      width: deviceWidth * 0.85,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        autofocus: false,
        obscureText: true,
        style: TextStyle(color: Colors.white, fontSize: 16),    
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
            hintText: 'Password',
            hintStyle: TextStyle(color: Colors.white, fontSize: 16),
            contentPadding: EdgeInsets.fromLTRB(20.0, 13.0, 20.0, 10.0),
            border:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            filled: true,
            fillColor: Colors.white.withOpacity(0.4)),
      ),
    );

    final passwordConfirm = Container(
      width: deviceWidth * 0.85,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        autofocus: false,
        obscureText: true,
        style: TextStyle(color: Colors.white, fontSize: 16),    
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
            hintText: 'Confirm Password',
            hintStyle: TextStyle(color: Colors.white, fontSize: 16),
            contentPadding: EdgeInsets.fromLTRB(20.0, 13.0, 20.0, 10.0),
            border:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            filled: true,
            fillColor: Colors.white.withOpacity(0.4)),
      ),
    );


    final signUpButton = OutlineButton(
      borderSide: BorderSide(color: Colors.white, width: 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      onPressed: () {    
      },
      padding:
          EdgeInsets.symmetric(vertical: 13, horizontal: deviceWidth * 0.33),
      child: Text('Sign Up',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
    );

    return new Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Stack(
          children: <Widget>[
            Positioned(
                width: deviceWidth,
                height: deviceHeight,
                child: Image(
                  image: AssetImage("assets/images/login_background.jpg"),
                  fit: BoxFit.cover,
                )),
            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[                
                    SizedBox(width: deviceWidth),

                    SizedBox(height: deviceHeight * 0.12),
                    signUpText,
                    SizedBox(height: deviceHeight * 0.13),
                    fullName,
                    SizedBox(height: deviceHeight * 0.02),
                    email,
                    SizedBox(height: deviceHeight * 0.02),
                    password,
                    SizedBox(height: deviceHeight * 0.02),
                    passwordConfirm,
                    SizedBox(height: deviceHeight * 0.1),
                    signUpButton,
                    SizedBox(height: deviceHeight * 0.1),
                  ],
                ),
              ),
            ),
            SizedBox(height: deviceHeight)
          ],
        ),
      ),
    );
  }
}
