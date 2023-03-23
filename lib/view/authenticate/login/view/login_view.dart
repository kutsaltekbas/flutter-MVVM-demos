import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:parolla_game_mvvm/core/base/view/base_view.dart';
import 'package:parolla_game_mvvm/core/constants/enums/locale_keys_enum.dart';
import 'package:parolla_game_mvvm/core/init/cache/locale_manager.dart';
import 'package:parolla_game_mvvm/core/init/lang/language_manager.dart';
import 'package:parolla_game_mvvm/core/init/lang/locale_keys.g.dart';
import 'package:parolla_game_mvvm/core/init/theme/light/color_scheme_light.dart';
import 'package:parolla_game_mvvm/view/home/view/home_view.dart';
import '../viewmodel/login_view_model.dart';
import 'package:parolla_game_mvvm/core/extension/context_extension.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (viewmodel) {
        viewmodel.setContext(context);
        viewmodel.init();
      },
      onPageBuilder: (context, viewmodel) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: context.paddingMedium,
              width: context.width,
              height: context.height,
              decoration: background(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: context.height * 0.1,
                  ),
                  Row(
                    children: [
                      welcomeText(),
                      dropdown(viewmodel)
                    ],
                  ),
                  SizedBox(height: context.height * 0.05),
                  emailTextField(viewmodel, context),
                  SizedBox(height: context.height * 0.05),
                  passwordTextField(viewmodel, context),
                  SizedBox(height: context.height * 0.07),
                  loginButton(context, viewmodel),
                  SizedBox(height: context.height * 0.01),
                  forgotPasswordButton(),
                  SizedBox(height: context.height * 0.06),
                  connectWithText(),
                  SizedBox(height: context.height * 0.02),
                  connectWithButtons(context),
                  SizedBox(height: context.height * 0.04),
                  signUp(context)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  DropdownButton<Object?> dropdown(LoginViewModel viewModel) => 
  DropdownButton<String>(
    items: viewModel.loginDropdownItems.map<DropdownMenuItem<String>>((String value){
      return DropdownMenuItem<String>(value: value,child: Text(value.toString()));
    }).toList(), onChanged:((value) {
      
    } ));

  Row signUp(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [dontHaveAccButton(context), signUpButton(context)],
      );

  SizedBox dontHaveAccButton(BuildContext context) {
    return SizedBox(
      child: Text(
        "Dont have account? ",
        style: TextStyle(
            fontSize: 16, fontStyle: FontStyle.italic, color: Colors.blueGrey),
      ),
    );
  }

  SizedBox signUpButton(BuildContext context) {
    return SizedBox(
        child: InkWell(
      onTap: () {},
      child: Text(
        "Sign up",
        style:
            TextStyle(fontSize: 15, color: ColorSchemaLight.instance.facebook),
      ),
    ));
  }

  Row connectWithButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        facebookLoginButton(context),
        SizedBox(
          width: context.width * 0.07,
        ),
        googleLoginButton(context)
      ],
    );
  }

  Widget googleLoginButton(BuildContext context) => Container(
      height: context.height * 0.07,
      width: context.width * 0.35,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffDB4437), elevation: 10),
          onPressed: () {},
          child: Icon(
            Bootstrap.google,
            size: context.height * 0.035,
            color: Colors.white,
          )));

  Widget facebookLoginButton(BuildContext context) => Container(
      height: context.height * 0.07,
      width: context.width * 0.35,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 10,
              backgroundColor: ColorSchemaLight.instance.facebook),
          onPressed: () {},
          child: Icon(
            Bootstrap.facebook,
            size: context.height * 0.035,
          )));

  Center connectWithText() {
    // sayfadaki textstyle'ler fixlenecek.
    return Center(
      child: Text(
        "or connect with",
        style: TextStyle(
            fontSize: 16, color: Colors.blueGrey, fontStyle: FontStyle.italic),
      ),
    );
  }

  Text welcomeText() {
    return Text(
      LocaleKeys.splash_welcome.tr(),
      style: TextStyle(
          fontSize: 32,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(offset: Offset(-1, 2), blurRadius: 15, color: Colors.grey)
          ]),
    );
  }

  Widget forgotPasswordButton() => GestureDetector(
        onTap: () {},
        child: Text(
          LocaleKeys.login_forgotText.tr(),
          style: TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.italic,
              color: Colors.blueGrey),
        ),
      );

  Widget loginButton(BuildContext context, LoginViewModel viewmodel) =>
      SizedBox(
        width: context.width,
        height: context.height * 0.07,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 10,
                backgroundColor: ColorSchemaLight.instance.accentGreen),
            onPressed: ()  {
              viewmodel.signIn();
            },
            child: Text(
              LocaleKeys.login_login.tr(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )),
      );

  Widget emailTextField(LoginViewModel viewmodel, BuildContext context) =>
      SizedBox(
        width: context.width,
        child: Card(
          elevation: 10,
          child: TextField(
              cursorColor: ColorSchemaLight.instance.accentGreen,
              controller: viewmodel.emailController,
              decoration: InputDecoration(
                  prefixIconColor: ColorSchemaLight.instance.accentGreen,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusColor: ColorSchemaLight.instance.accentGreen,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorSchemaLight.instance.accentGreen)),
                  prefixIcon: Icon(
                    Icons.mail,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: LocaleKeys.login_email.tr(),
                  hintStyle: TextStyle(fontStyle: FontStyle.italic))),
        ),
      );

  Widget passwordTextField(LoginViewModel viewmodel, BuildContext context) =>
      SizedBox(
        width: context.width,
        child: Card(
          elevation: 10,
          child: TextField(
              obscuringCharacter: '*',
              obscureText: true,
              cursorColor: ColorSchemaLight.instance.accentGreen,
              controller: viewmodel.passwordController,
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.remove_red_eye_outlined,
                    size: 20,
                  ),
                  suffixIconColor: Colors.blueGrey,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorSchemaLight.instance.accentGreen)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: ColorSchemaLight.instance.accentGreen,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: LocaleKeys.login_password.tr(),
                  hintStyle: TextStyle(fontStyle: FontStyle.italic))),
        ),
      );

  BoxDecoration background() {
    return BoxDecoration(
        image: DecorationImage(
            image: AssetImage("asset/image/background.jpg"),
            fit: BoxFit.cover));
  }
}
