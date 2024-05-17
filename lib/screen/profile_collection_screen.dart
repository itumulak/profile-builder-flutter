import 'package:builder_pattern_exercise/models/user_builder.dart';
import 'package:flutter/material.dart';

class ProfileCollectionScreen extends StatelessWidget {
  const ProfileCollectionScreen({super.key});

  static const route = '/profile-collection';

  @override
  Widget build(BuildContext context) {
    late ProfileBadge profileBadge;
    late ProfileId profileID;

    Widget getProfileBadge(BuildContext context) {
      profileBadge = ProfileBadge();

      return profileBadge.buildOutput(context);
    }

    Widget getProfileId(BuildContext context) {
      profileID = ProfileId();

      return profileID.buildOutput(context);
    }

    return MaterialApp(
      home: Scaffold(
        body: Scaffold(
          backgroundColor: Colors.black87,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getProfileBadge(context),
                const SizedBox(
                  height: 60,
                ),
                getProfileId(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
