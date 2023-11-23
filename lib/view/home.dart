import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:resume_creater/extensions/responsive.dart';
import 'package:resume_creater/provider/working.dart';
import 'package:resume_creater/view/resume_view.dart';
import 'package:resume_creater/widgets/image_piucker.dart';
import 'package:resume_creater/widgets/modified_textfield.dart';
import 'package:resume_creater/widgets/styled_text.dart';

class Home extends ConsumerWidget {
  Home({super.key});

  final name = TextEditingController();
  final profession = TextEditingController();
  final city = TextEditingController();
  final pin = TextEditingController();
  final mobilenumber = TextEditingController();
  final email = TextEditingController();
  final jobtitle = TextEditingController();
  final employer = TextEditingController();
  final expericeCount = TextEditingController();
  final school = TextEditingController();
  final schoolLocation = TextEditingController();
  final education = TextEditingController();
  final fieldOFstudy = TextEditingController();
  final graduvatedIN = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final working = ref.watch(workProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Resume Creater"),
        ),
        body: Padding(
          padding: EdgeInsets.all(context.width(10)),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StyledText(
                  text: "Enter Your Name",
                ),
                Gap(context.width(10)),
                ModifiedTextField(
                  controller: name,
                  text: "Enter Your Full Name",
                ),
                Gap(context.width(20)),
                const StyledText(
                  text: "Enter Your Profession",
                ),
                Gap(context.width(10)),
                ModifiedTextField(
                  controller: profession,
                  text: "Enter Your Profession",
                ),
                Gap(context.width(20)),
                Row(
                  children: [
                    const StyledText(text: "Enter City"),
                    Gap(
                      context.width(105),
                    ),
                    const StyledText(text: "Enter Pin code")
                  ],
                ),
                Gap(context.width(10)),
                Row(
                  children: [
                    SizedBox(
                      width: context.width(190),
                      child: ModifiedTextField(
                          controller: pin, text: "Enter Your City"),
                    ),
                    Gap(context.width(10)),
                    SizedBox(
                      width: context.width(200),
                      child: ModifiedTextField(
                        controller: city,
                        text: "Enter Pin code",
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(6)
                        ],
                      ),
                    ),
                  ],
                ),
                Gap(context.width(20)),
                const StyledText(text: "Enter Your Mobile Number"),
                Gap(context.width(10)),
                ModifiedTextField(
                  controller: mobilenumber,
                  text: "Enter Your Mobile Number",
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10)
                  ],
                ),
                Gap(context.width(20)),
                const StyledText(text: "Enter Your Email Address"),
                Gap(context.width(10)),
                ModifiedTextField(
                  controller: email,
                  text: "Enter Your Email Address",
                  keyboardType: TextInputType.emailAddress,
                ),
                Gap(context.width(20)),
                const StyledText(text: "Do You Have Any Work Experience?"),
                Gap(context.width(10)),
                Row(
                  children: [
                    const StyledText(text: "Yes"),
                    IconButton(
                      onPressed: () =>
                          ref.read(workProvider.notifier).state = !working,
                      icon: working == false
                          ? const Icon(Icons.radio_button_unchecked)
                          : const Icon(
                              Icons.radio_button_checked_outlined,
                              color: Colors.blue,
                            ),
                    ),
                    Gap(context.width(20)),
                    const StyledText(text: "No"),
                    IconButton(
                      onPressed: () =>
                          ref.read(workProvider.notifier).state = !working,
                      icon: working == false
                          ? const Icon(
                              Icons.radio_button_checked_outlined,
                              color: Colors.blue,
                            )
                          : const Icon(
                              Icons.radio_button_off,
                            ),
                    ),
                  ],
                ),
                Gap(context.width(10)),
                working == false
                    ? graduvationDetails(context)

                    //if user have any Experice Show this column
                    : _ifUserHaveExperice(context),
                Gap(context.width(20)),
                const Center(
                  child: ImagePickerShowing(),
                ),
                SizedBox(
                  height: context.width(50),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            if (ref.watch(workProvider) != true
                ? name.text.isEmpty ||
                    city.text.isEmpty ||
                    profession.text.isEmpty ||
                    email.text.isEmpty ||
                    education.text.isEmpty ||
                    fieldOFstudy.text.isEmpty ||
                    graduvatedIN.text.isEmpty ||
                    mobilenumber.text.isEmpty ||
                    pin.text.isEmpty ||
                    school.text.isEmpty ||
                    schoolLocation.text.isEmpty
                : name.text.isEmpty ||
                    city.text.isEmpty ||
                    profession.text.isEmpty ||
                    email.text.isEmpty ||
                    education.text.isEmpty ||
                    fieldOFstudy.text.isEmpty ||
                    graduvatedIN.text.isEmpty ||
                    mobilenumber.text.isEmpty ||
                    pin.text.isEmpty ||
                    school.text.isEmpty ||
                    schoolLocation.text.isEmpty ||
                    employer.text.isEmpty ||
                    expericeCount.text.isEmpty ||
                    jobtitle.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: StyledText(text: "Fill Madotory Columns")));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResumeView(
                        name: name.text,
                        city: city.text,
                        profession: profession.text,
                        email: email.text,
                        education: education.text,
                        fieldOFstudy: fieldOFstudy.text,
                        graduvatedIN: graduvatedIN.text,
                        mobilenumber: mobilenumber.text,
                        pin: pin.text,
                        school: school.text,
                        schoolLocation: schoolLocation.text,
                        employer: employer.text,
                        expericeCount: expericeCount.text,
                        jobtitle: jobtitle.text),
                  ));
            }
          },
          child: Container(
            width: context.width(200),
            height: context.width(80),
            color: Colors.blue,
            child: const Center(
              child: StyledText(
                text: "Create Resume",
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column graduvationDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const StyledText(text: "Enter Your Education Details"),
        Gap(
          context.width(10),
        ),
        ModifiedTextField(
          controller: school,
          text: 'Enter School Name',
        ),
        Gap(context.width(20)),
        const StyledText(text: "Enter Your School Location"),
        Gap(
          context.width(10),
        ),
        ModifiedTextField(
          controller: schoolLocation,
          text: 'Enter School Location',
        ),
        Gap(context.width(20)),
        const StyledText(text: "Enter Your Graduation Details"),
        Gap(
          context.width(10),
        ),
        ModifiedTextField(
          controller: education,
          text: 'Enter Graduvation',
        ),
        Gap(context.width(20)),
        const StyledText(text: "Enter Your Field of Study"),
        Gap(
          context.width(10),
        ),
        ModifiedTextField(
          controller: fieldOFstudy,
          text: 'Enter Field of Study',
        ),
        Gap(context.width(20)),
        const StyledText(text: "Enter Your Graduated date"),
        Gap(
          context.width(10),
        ),
        SizedBox(
          width: context.width(200),
          child: ModifiedTextField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.datetime,
            controller: graduvatedIN,
            text: 'Enter Graduated Date',
          ),
        ),
      ],
    );
  }

  Column _ifUserHaveExperice(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const StyledText(text: "Enter Your Job Title"),
        Gap(context.width(10)),
        ModifiedTextField(controller: jobtitle, text: " Enter Your Job Title"),
        Gap(context.width(20)),
        const StyledText(text: "Enter Employer"),
        Gap(context.width(10)),
        ModifiedTextField(controller: employer, text: "Enter The Employer"),
        Gap(context.width(20)),
        const StyledText(text: "Enter Exeperience"),
        Gap(context.width(10)),
        SizedBox(
          width: context.width(160),
          child: ModifiedTextField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(2)
            ],
            controller: expericeCount,
            text: "Enter Your Experience",
          ),
        ),
        Gap(context.width(20)),
        graduvationDetails(context),
      ],
    );
  }
}
