import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const <Widget>[
          ProfilePhotoHeader(),
        ],
      ),
    );
  }
}

class ProfilePhotoHeader extends StatelessWidget {
  const ProfilePhotoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bitmap/header_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 53,
                backgroundImage: NetworkImage("https://picsum.photos/200"),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: AppColor.imperialRed,
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.add_a_photo_outlined,
                    color: AppColor.imperialRed,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
