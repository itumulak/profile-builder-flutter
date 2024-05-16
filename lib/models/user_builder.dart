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

  CircleAvatar getAvatar() {
    return const CircleAvatar(
      radius: 48,
      backgroundImage: NetworkImage(
          'https://secure.gravatar.com/avatar/3bbd5c6e1b3190a72350bbb9b31dfb2d?s=100&d=mm&r=g'),
    );
  }

  void getInfo(BuildContext context) {
    user = Provider.of<User>(context);
  }

  Text getFullName({TextStyle? textStyle}) {
    textStyle ??= const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 36
    );

    return Text(
      '${user.firstName} ${user.lastName}',
      style: textStyle,
    );


  }

  Text getProfession({TextStyle? textStyle}) {
    textStyle ??= const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28
    );

    return Text(
      user.profession,
      style: textStyle,
    );
  }
}

class ProfileBadge extends UserBuilder {
  Text getMetaInfo({TextStyle? textStyle}) {
    List<String> meta = [];

    textStyle ??= const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28
    );

    meta.add(user.emailAddress);

    if ( user.phoneNumber.isNotEmpty ) {
      meta.add(user.phoneNumber);
    }

    return Text(
      meta.join(' | '),
      style: textStyle,
    );
  }

  @override
  Widget output(BuildContext context) {
    getInfo(context);

    return Column(
      children: [
        getAvatar(),
        getFullName(),
        getProfession(),
        getMetaInfo()
      ],
    );
  }
}

class ProfileId extends UserBuilder {
  @override
  Widget output(BuildContext context) {
    getInfo(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black,
              )
          ),
          child: Row(
            children: [
              getAvatar(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getFullName(),
                  getProfession(),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}