import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';

class ProfilePic extends StatelessWidget {
  ProfilePic({
    Key? key,
  }) : super(key: key);
  final localstore = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/user_login.png"),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Docteur Parfait",
          style: TextStyle(fontSize: 25),
        ),
      ],
    );
  }
}
