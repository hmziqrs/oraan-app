import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';

import 'package:oraan/providers/auth/provider.dart';
import 'package:oraan/configs/AppDimensions.dart';
import 'package:oraan/configs/TextStyles.dart';
import 'package:oraan/configs/AppTheme.dart';

import 'package:oraan/UI.dart';

import 'package:oraan/widgets/Screen/Screen.dart';

import 'Dimensions.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    @required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: LoginScreenChild(),
    );
  }
}

class LoginScreenChild extends StatefulWidget {
  @override
  _LoginScreenChildState createState() => _LoginScreenChildState();
}

class _LoginScreenChildState extends State<LoginScreenChild> {
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  String phone = ""; //"03452785722"
  String password = ""; //"hasan@123"
  bool showPassword = false;

  void togglePassword() {
    setState(() {
      this.showPassword = !this.showPassword;
    });
  }

  void submitForm() async {
    final isClean = this.fromKey.currentState.validate();

    if (isClean) {
      final freshState = await this.getAuth().login(
            phone: this.phone,
            password: this.password,
          );
      if (freshState.user != null) {
        Navigator.pushReplacementNamed(context, "home");
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Container(
              margin: EdgeInsets.all(AppDimensions.padding * 2),
              child: Text("Error! Can't signin"),
            ),
          ),
        );
      }
    }
  }

  AuthProvider getAuth([listen = false]) =>
      Provider.of<AuthProvider>(context, listen: listen);

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    final authState = this.getAuth(true);

    return Form(
      key: this.fromKey,
      child: Align(
        child: Container(
          width: AppDimensions.containerWidth,
          height: UI.safeHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        transform: Matrix4.identity()
                          ..translate(
                            -Dimensions.iconTranslateX,
                            AppDimensions.padding,
                          ),
                        child: Icon(
                          Icons.chevron_left,
                          size: TextStyles.heading2.fontSize,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        "Welcome Back",
                        textAlign: TextAlign.center,
                        style: TextStyles.heading16.copyWith(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppDimensions.padding),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 3,
                  vertical: AppDimensions.padding * 1,
                ),
                child: TextFormField(
                  initialValue: this.phone,
                  onChanged: (str) {
                    this.setState(() {
                      this.phone = str;
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  validator: ValidationBuilder().phone().build(),
                  cursorColor: AppTheme.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                    labelText: "Phone Number",
                    labelStyle: TextStyles.body1.copyWith(
                      color: AppTheme.textSub,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: AppDimensions.padding * 1,
                      horizontal: AppDimensions.padding * 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppDimensions.padding),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 3,
                  vertical: AppDimensions.padding * 1,
                ),
                child: TextFormField(
                  initialValue: this.password,
                  onChanged: (str) {
                    this.setState(() {
                      this.password = str;
                    });
                  },
                  obscuringCharacter: "*",
                  validator: ValidationBuilder()
                      .minLength(1, "Password shouldn't be empty")
                      .build(),
                  cursorColor: AppTheme.text,
                  obscureText: this.showPassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: this.togglePassword,
                      icon: Icon(
                        this.showPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppTheme.textSub,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyles.body1.copyWith(
                      color: AppTheme.textSub,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: AppDimensions.padding * 2,
                      horizontal: AppDimensions.padding * 3,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppDimensions.padding),
              FlatButton(
                color: AppTheme.primary,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onPressed: () => !authState.loading ? this.submitForm() : null,
                child: authState.loading
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 3.0,
                          valueColor: AlwaysStoppedAnimation(
                            Colors.white,
                          ),
                        ),
                      )
                    : Text(
                        "LOGIN",
                      ),
              ),
              SizedBox(height: AppDimensions.padding * 1),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppDimensions.padding * 1,
                    horizontal: AppDimensions.padding * 2,
                  ),
                  child: Text(
                    "FORGOT PASSCODE?",
                    style: TextStyles.body16.copyWith(
                      color: authState.loading
                          ? AppTheme.textSub
                          : AppTheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
