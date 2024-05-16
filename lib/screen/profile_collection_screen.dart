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

      return profileBadge.output(context);
    }

    Widget getProfileId(BuildContext context) {
      profileID = ProfileId();

      return profileID.output(context);
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Builders',
            style: TextStyle(fontSize: 64),
          ),
          const SizedBox(
            height: 20,
          ),
          getProfileBadge(context),
          const SizedBox(
            height: 30,
          ),
          getProfileId(context),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Builders with a Director',
            style: TextStyle(fontSize: 64),
          ),
        ],
      ),
    );
  }
}
