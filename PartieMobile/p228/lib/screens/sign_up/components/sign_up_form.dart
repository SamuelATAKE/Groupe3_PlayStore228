import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/api_link.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/shop/shop_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String error = "";
  bool correct = false;

  final _email = TextEditingController();
  final _password = TextEditingController();

  bool onValide = false;

  final localStore = GetStorage();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  // Traitement avec dio
  void userLogin(String email, String password) async {
    try {
      // LAncement de requête
      var response = await Dio()
          .post(login_api, data: {'email': email, 'password': password});
      print(jsonDecode(response.data)['error']);

      if (response.statusCode == 200) {
        if (jsonDecode(response.data)['error'] == null) {
          // Annulation de l'erreur
          setState(() {
            error = "";
          });
          // Enregistrement de session
          localStore.write("email", email);
          localStore.write("nom", jsonDecode(response.data)['nom']);
          localStore.write("prenom", jsonDecode(response.data)['prenom']);
          localStore.write("pays", jsonDecode(response.data)['pays']);
          localStore.write("token", jsonDecode(response.data)['token']);

          // Affichage de dialog
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => const AlertDialog(
              title: Text('Connexion effectué'),
              content: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 80.0,
              ),
            ),
          );
          // Return a la base
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => ShopScreen()),
              (route) => false);
        } else {
          // En présence d'erreur
          setState(() {
            error = jsonDecode(response.data)['error'];
          });
        }
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  String? get _emailErrorText {
    final text = _email.value.text;
    if (onValide) {
      if (text.isEmpty) {
        return 'Complèter ce champ';
      }
      // return null if the text is valid
      return null;
    }
  }

  String? get _passwordErrorText {
    final text = _password.value.text;
    if (onValide) {
      if (text.isEmpty) {
        return 'Complèter ce champ';
      }
      // return null if the text is valid
      return null;
    }
  }

  bool? _buttonStatus() {
    if (onValide) {
      if (_emailErrorText == null && _passwordErrorText == null) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // buildNomFormField(),
          // SizedBox(height: getProportionateScreenHeight(30)),
          // buildPrenomFormField(),
          Text(
            "$error",
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          // buildConfirmPassFormField(),
          // FormError(errors: errors),
          // SizedBox(height: getProportionateScreenHeight(40)),

          DefaultButton(
            text: "Se connecter",
            press: () {
              setState(() {
                onValide = true;
              });
              if (_emailErrorText == null && _passwordErrorText == null) {
                userLogin(_email.value.text, _password.value.text);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.text,
      controller: _password,
      onSaved: (newValue) => password = newValue,
      validator: (value) {},
      decoration: InputDecoration(
        errorText: _passwordErrorText,
        labelText: "Mot de passe",
        hintText: "Votre mot de passe",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSurffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _email,
      onSaved: (newValue) => email = newValue,
      validator: (value) {},
      decoration: InputDecoration(
        errorText: _emailErrorText,
        labelText: "Email",
        hintText: "Votre adresse email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
