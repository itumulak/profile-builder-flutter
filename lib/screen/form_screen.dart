import 'package:builder_pattern_exercise/models/user.dart';
import 'package:builder_pattern_exercise/screen/profile_collection_screen.dart';
import 'package:builder_pattern_exercise/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/validation.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  static const route = '/form';

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final firstNameController = TextEditingController(text: 'Ian');
    final lastNameController = TextEditingController(text: 'Tumulak');
    final emailAddressController = TextEditingController(text: 'xxxxxxx@gmail.com');
    final professionController = TextEditingController(text: 'Flutter Developer');
    final ageController = TextEditingController(text: '');
    final phoneController = TextEditingController(text: '');
    final addressController = TextEditingController(text: '');
    final userProvider = Provider.of<User>(context);

    void submitInfo() {
      userProvider.setFirstName(firstNameController.text); // required
      userProvider.setLastName(lastNameController.text); // required
      userProvider.setEmailAddress(emailAddressController.text); // required
      userProvider.setProfession(professionController.text); // required
      userProvider.setAge(ageController.text); // optional
      userProvider.setPhoneNumber(phoneController.text); // optional
      userProvider.setAddress(addressController.text); //optional
    }

    return SafeArea(
        child: Scaffold(
          body: Center(
            child: SizedBox(
              width: 300,
              child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InputField(
                          labelText: 'First name',
                          controller: firstNameController,
                          prerequisite: isRequired,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InputField(
                          labelText: 'Last name',
                          controller: lastNameController,
                          prerequisite: isRequired,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InputField(
                          labelText: 'Email address',
                          controller: emailAddressController,
                          prerequisite: isEmail,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InputField(
                          labelText: 'Profession',
                          controller: professionController,
                          prerequisite: isRequired,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InputField(
                          labelText: 'Age',
                          controller: ageController,
                          numberInputOnly: true,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InputField(
                          labelText: 'Phone number',
                          controller: phoneController,
                          numberInputOnly: true,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InputField(
                          labelText: 'Address',
                          controller: addressController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if ( formKey.currentState!.validate() ) {
                              submitInfo();
                              Navigator.pushNamed(context, ProfileCollectionScreen.route);
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ),
        )
    );
  }
}

