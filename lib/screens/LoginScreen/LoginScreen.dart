import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

import 'package:oraan/configs/AppDimensions.dart';
import 'package:oraan/configs/TextStyles.dart';
import 'package:oraan/configs/AppTheme.dart';
import 'package:oraan/UI.dart';

import 'package:oraan/widgets/Screen/Screen.dart';

import 'Dimensions.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  bool showPassword = false;

  void togglePassword() {
    setState(
      () {
        this.showPassword = !this.showPassword;
      },
    );
  }

  void validateForm() {
    final isClean = this.fromKey.currentState.validate();
    if (isClean) {
      // TODO submit
    }
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return Screen(
      child: Form(
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
                  onPressed: () => this.validateForm(),
                  child: Text(
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
                        color: AppTheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
