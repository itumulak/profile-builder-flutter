import 'dart:ffi';

import 'package:builder_pattern_exercise/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class BuilderOutput {
  Widget output(BuildContext context) {
    return Container();
  }
}

abstract class UserBuilder implements BuilderOutput {
  @protected
  late User user;

  void getInfo(BuildContext context) {
    user = Provider.of<User>(context);
  }

  CircleAvatar getAvatar({
    double radius = 50.0,
    String networkImage = 'https://secure.gravatar.com/avatar/3bbd5c6e1b3190a72350bbb9b31dfb2d?s=100&d=mm&r=g'
  }) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      backgroundImage: NetworkImage(networkImage)
    );
  }

  Text getFullName({TextStyle? textStyle}) {
    textStyle ??= const TextStyle(
      color: Colors.white,
      letterSpacing: 2,
      fontWeight: FontWeight.bold,
      fontSize: 32,
      fontFamily: 'Pacifico',
    );

    return Text(
      '${user.firstName} ${user.lastName}',
      style: textStyle,
    );
  }

  Text getProfession({TextStyle? textStyle}) {
    textStyle ??= const TextStyle(
      color: Colors.white,
      letterSpacing: 1.5,
      fontWeight: FontWeight.bold,
      fontSize: 24,
      fontFamily: 'Source Sans 3',
    );

    return Text(
      user.profession,
      style: textStyle,
    );
  }
}

class ProfileBadge extends UserBuilder {
  Container getBorderLine() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 2,
      width: 150,
      color: Colors.tealAccent,
    );
  }

  RichText getAllMeta({TextStyle? textStyle}) {
    List<InlineSpan> meta = [];

    textStyle ??= const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28
    );

    meta.add(
      const WidgetSpan(
        child: Icon(
          Icons.email,
          color: Colors.white,
          size: 16,
        ),
        alignment: PlaceholderAlignment.middle
      ),
    );

    meta.add(
      TextSpan(text: '  ${user.emailAddress}')
    );

    if ( user.phoneNumber.isNotEmpty ) {
      meta.add(const TextSpan(text: '  |  '));

      meta.add(
        const WidgetSpan(
            child: Icon(
              Icons.phone,
              size: 16,
              color: Colors.white,
            ),
            alignment: PlaceholderAlignment.middle
        ),
      );

      meta.add(
          TextSpan(text: '  ${user.emailAddress}')
      );
    }

    return RichText(text: TextSpan(
      children: meta
    ));
  }

  @override
  Widget output(BuildContext context) {
    getInfo(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getAvatar(),
        getFullName(),
        getProfession(),
        getBorderLine(),
        getAllMeta()
      ],
    );
  }
}

class ProfileId extends UserBuilder {
  Row getAge() {
    if (user.age.isNotEmpty) {
      return Row(
        children: [
          const Icon(Icons.person),
          Text('   Age: ${user.age}')
        ],
      );
    }

    return const Row(children: []);
  }

  Row getAddress() {
    if (user.address.isNotEmpty) {
      return Row(
        children: [
          const Icon(Icons.maps_home_work),
          Text('   Location: ${user.address}')
        ],
      );
    }

    return const Row(children: []);
  }

  @override
  Widget output(BuildContext context) {
    getInfo(context);

    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 100,
          maxWidth: 500,
          minHeight: 100,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          color: Colors.white
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.teal,
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: const Center(
                child: Text(
                  'Hi! My name is',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Source Code Pro',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: getAvatar(radius: 40),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      getFullName(
                        textStyle: const TextStyle(
                          color: Colors.black87,
                          fontSize: 32,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      getProfession(
                        textStyle: const TextStyle(
                          color: Colors.black87,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.teal,
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getAge(),
                  getAddress()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}