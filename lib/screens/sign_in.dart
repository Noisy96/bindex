import "package:flutter/material.dart";
import "package:bindex_app/screens/sign_up.dart";

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // TODO : Refactor this code using expanded widget to get rid of the need to using device height and width
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
  
    final logo = Image(
      image: AssetImage("assets/images/bindex_logo.png"),
      width: deviceWidth * 0.6,
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
  
    final forgotPassword = Container(
      width: deviceWidth * 0.85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              "Forgot password?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),            
            ),
          )
        ],
      ),
    );
  
    final signInButton = RaisedButton(    
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () {      
      },
    
      padding:
          EdgeInsets.symmetric(vertical: 14, horizontal: deviceWidth * 0.34),
      color: Color(0xBA2981).withOpacity(1),
      child: Text('Sign in',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
    );
  
    final orLoginText = Text(
      "Or login with",
      style: TextStyle(color: Colors.white, fontSize: 15),
    );
  
    final otherLoginButtons = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton.icon(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              
            },
            icon: ImageIcon(AssetImage("assets/icons/facebook_icon.png"),
                color: Colors.blue[900]),
            label: Text("facebook",
                style: TextStyle(color: Colors.blue[900], fontSize: 16)),
          ),
          SizedBox(width: 32),
          RaisedButton.icon(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                
              },
              icon: ImageIcon(AssetImage("assets/icons/google_icon.png"),
                  color: Colors.red[600]),
              label: Text("  Google  ",
                  style: TextStyle(color: Colors.red[600], fontSize: 16)))
        ],
      );
    
    final signup = GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUpPage()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 3, color: Colors.white))),
        child: Text(
          "SIGN UP",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
    );

    return new Scaffold(    
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
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
                    SizedBox(height: deviceHeight * 0.17),
                    logo,
                    SizedBox(height: deviceHeight * 0.13),
                    email,
                    SizedBox(height: deviceHeight * 0.02),
                    password,                  
                    forgotPassword,
                    SizedBox(height: deviceHeight * 0.01),
                    signInButton,
                    SizedBox(height: deviceHeight * 0.03),
                    orLoginText,
                    otherLoginButtons,
                    SizedBox(height: deviceHeight * 0.05),
                    signup
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
