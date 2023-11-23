import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:resume_creater/extensions/responsive.dart';
import 'package:resume_creater/provider/working.dart';
import 'package:resume_creater/widgets/image_piucker.dart';
import 'package:resume_creater/widgets/styled_text.dart';

class ResumeView extends ConsumerWidget {
  const ResumeView(
      {super.key,
      required this.name,
      required this.city,
      required this.profession,
      required this.email,
      required this.education,
      required this.fieldOFstudy,
      required this.graduvatedIN,
      required this.mobilenumber,
      required this.pin,
      required this.school,
      required this.schoolLocation,
      this.employer,
      this.expericeCount,
      this.jobtitle});
  final String name;
  final String profession;
  final String city;
  final String pin;
  final String mobilenumber;
  final String email;
  final String? jobtitle;
  final String? employer;
  final String? expericeCount;
  final String school;
  final String schoolLocation;
  final String education;
  final String fieldOFstudy;
  final String graduvatedIN;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: StyledText(text: "$name Resume"),
      ),
      body: Padding(
        padding: EdgeInsets.all(context.width(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const ImagePickerShowing(),
                Gap(
                  context.width(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledText(text: name),
                    Gap(context.width(2)),
                    StyledText(text: "+91 $mobilenumber"),
                    Gap(context.width(2)),
                    StyledText(text: email),
                    Gap(context.width(2)),
                    StyledText(text: profession)
                  ],
                ),
              ],
            ),
            Text(
              "Educational Deatils",
              style: TextStyle(
                fontSize: context.width(23),
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(context.width(15)),
            StyledText(text: school),
            StyledText(text: schoolLocation),
            StyledText(text: education),
            StyledText(text: graduvatedIN),
            ref.watch(workProvider) == true
                ? Column(
                    children: [
                      Text(
                        "Work Status",
                        style: TextStyle(
                          fontSize: context.width(23),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(context.width(15)),
                      StyledText(text: jobtitle!),
                      StyledText(text: employer!),
                      StyledText(text: "Totel Experince $expericeCount"),
                      StyledText(text: graduvatedIN),
                    ],
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
