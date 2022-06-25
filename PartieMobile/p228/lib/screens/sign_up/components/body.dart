import 'package:flutter/material.dart';
import 'package:shop_app/api_link.dart';
import 'package:shop_app/components/socal_card.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/services/url_launch.dart';
import 'package:shop_app/size_config.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Text("Connectez-vous", style: headingStyle),
                Text(
                  "Entrez vos informations de connexion",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),

                SizedBox(height: getProportionateScreenHeight(20)),

                GestureDetector(
                  onTap: () {
                    OpenBrowser(sign_up_link);
                  },
                  child: Text(
                    'Si vous n\'avez pas encore de compte, \nveuillez créer un compte',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Orange),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
