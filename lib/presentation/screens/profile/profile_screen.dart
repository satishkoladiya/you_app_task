import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:you_app_task/core/api/profile/model/profile_data.dart';
import 'package:you_app_task/core/utils/age_calculation.dart';
import 'package:you_app_task/core/utils/horoscope_zodiac_calculations.dart';
import 'package:you_app_task/presentation/bloc/profile/profile_bloc.dart';
import 'package:you_app_task/presentation/bloc/profile/profile_event.dart';
import 'package:you_app_task/presentation/bloc/profile/profile_state.dart';
import 'package:you_app_task/presentation/widget/edit_filed.dart';
import 'package:you_app_task/presentation/widget/gender_selection_widget.dart';
import 'package:you_app_task/presentation/widget/golden_gradient_widget.dart';
import 'package:you_app_task/presentation/widget/golden_text.dart';

class ProfileScreen extends StatefulWidget {
  String acessToken;

  ProfileScreen(this.acessToken);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ProfileBloc _profileBloc;
  late ProfileData PData;
  bool editAbout = false;
  TextEditingController DisplayNameController = TextEditingController();
  TextEditingController BrithdayController = TextEditingController();
  TextEditingController HoroscopeController = TextEditingController();
  TextEditingController ZodiacController = TextEditingController();
  TextEditingController HeightController = TextEditingController();
  TextEditingController WeightController = TextEditingController();
  String? gender = null;
  String image = "";
  String age = '0';
  String horoscope = '--';
  String zodiac = '--';

  @override
  void initState() {
    super.initState();
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
    _profileBloc.add(ProfileInitialLoad(widget.acessToken));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color(0xFF1F4247),
            Color(0xFF0D1D23),
            Color(0xFF09141A),
          ],
          focalRadius: 24,
        ),
      ),
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileError) {
            //print(state.exception.toString());
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.exception.toString(),
                style: const TextStyle(color: Colors.red),
              ),
              duration: const Duration(seconds: 3),
            ));
          }
        },
        child:
            BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          if (state is ProfileLoading) {
            return _buildLoading(context);
          } else if (state is ProfileLoaded) {
            PData = state.profileData;
            if (PData.birthday != "") {
              age = calculateAge(DateTime(
                  int.parse(PData.birthday.split(" ")[2]),
                  int.parse(PData.birthday.split(" ")[1]),
                  int.parse(PData.birthday.split(" ")[0])));

              horoscope = horoscopeSign(DateTime(
                  int.parse(PData.birthday.split(" ")[2]),
                  int.parse(PData.birthday.split(" ")[1]),
                  int.parse(PData.birthday.split(" ")[0])));

              zodiac = zodiacSign(DateTime(
                  int.parse(PData.birthday.split(" ")[2]),
                  int.parse(PData.birthday.split(" ")[1]),
                  int.parse(PData.birthday.split(" ")[0])));
            }

            return _buildProfile(context, state.profileData);
          } else if (state is ProfileError) {
            return _buildProfile(context, PData);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    ));
  }

  Widget _buildLoading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildProfile(BuildContext context, ProfileData profileData) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // GestureDetector(
            //   onTap: () {
            //     Navigator.pushReplacementNamed(context, '/');
            //   },
            //   child: Row(
            //     children: [
            //       Image.asset('assets/back.png', width: 7, height: 14),
            //       const SizedBox(width: 10),
            //       const Text(
            //         'Back',
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 14,
            //             fontWeight: FontWeight.bold,
            //             fontFamily: 'Inter'),
            //       ),
            //     ],
            //   ),
            // ),
            Text(
              '@${profileData.username}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(width: 47.0)
          ],
        ),
      ),
      const SizedBox(height: 10),
      Center(
          child: Container(
        width: 359,
        height: 190,
        decoration: BoxDecoration(
          color: image == "" ? const Color(0xFF162329) : null,
          image: image == ""
              ? null
              : DecorationImage(
                  image: FileImage(File(image)),
                  fit: BoxFit.cover,
                ),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: profileData.name == ''
              ? Text(
                  '@${profileData.username},',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '@${profileData.name.replaceAll(' ', '')}, ${age}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      gender ?? 'Male',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          //height: 36,
                          //alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(100),
                              right: Radius.circular(100),
                            ),
                            color: Colors.white.withOpacity(0.06),
                          ),
                          child: Row(
                            children: [
                              Image.asset('assets/Horoscope.png',
                                  width: 20, height: 20),
                              const SizedBox(width: 5),
                              Text(
                                horoscope,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          //height: 36,
                          //alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(100),
                              right: Radius.circular(100),
                            ),
                            color: Colors.white.withOpacity(0.06),
                          ),
                          child: Row(
                            children: [
                              Image.asset('assets/Zodiac.png',
                                  width: 20, height: 20),
                              const SizedBox(width: 5),
                              Text(
                                zodiac,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      )),
      Flexible(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
                width: 359.0,
                height: editAbout
                    ? 511.0
                    : profileData.name == ''
                        ? 120.0
                        : 217.0,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF0E191F),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'About',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Inter',
                              ),
                            ),
                            !editAbout
                                ? IconButton(
                                    icon: Image.asset('assets/edit-2.png'),
                                    onPressed: () {
                                      setState(() {
                                        editAbout = true;
                                        DisplayNameController.text =
                                            profileData.name;
                                        BrithdayController.text =
                                            profileData.birthday;
                                        HoroscopeController.text = horoscope;
                                        ZodiacController.text = zodiac;
                                        HeightController.text =
                                            "${profileData.height} cm";
                                        WeightController.text =
                                            "${profileData.weight} kg";
                                      });
                                    },
                                  )
                                : TextButton(
                                    onPressed: () {
                                      if (DisplayNameController.text == "" ||
                                          BrithdayController.text == "" ||
                                          HeightController.text == "" ||
                                          WeightController.text == "" ||
                                          gender == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text(
                                            "Please fill all the fields",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          duration: Duration(seconds: 3),
                                        ));
                                        return;
                                      }

                                      age = calculateAge(DateTime(
                                          int.parse(BrithdayController.text
                                              .split(" ")[2]),
                                          int.parse(BrithdayController.text
                                              .split(" ")[1]),
                                          int.parse(BrithdayController.text
                                              .split(" ")[0])));
                                      _profileBloc.add(ProfileUpdate(
                                          widget.acessToken,
                                          ProfileData(
                                            name: DisplayNameController.text,
                                            username: profileData.username,
                                            email: profileData.email,
                                            birthday: BrithdayController.text,
                                            height: int.parse(
                                                HeightController.text.substring(
                                                    0,
                                                    HeightController
                                                            .text.length -
                                                        3)),
                                            weight: int.parse(
                                                WeightController.text.substring(
                                                    0,
                                                    WeightController
                                                            .text.length -
                                                        3)),
                                            interests: profileData.interests,
                                          )));
                                      setState(() {
                                        editAbout = false;
                                        DisplayNameController.clear();
                                        BrithdayController.clear();
                                        HoroscopeController.clear();
                                        ZodiacController.clear();
                                        HeightController.clear();
                                        WeightController.clear();
                                        gender = null;
                                        image = "";
                                      });
                                    },
                                    child: goldenText(
                                        'Save & Update',
                                        const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Inter',
                                        ))),
                          ]),
                      const SizedBox(height: 15),
                      profileData.birthday == "" && !editAbout
                          ? Flexible(
                              child: Text(
                                "Add in your details to help others know you better",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.52),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            )
                          : editAbout
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            final ImagePicker picker =
                                                ImagePicker();
                                            picker
                                                .pickImage(
                                                    source: ImageSource.gallery)
                                                .then((value) {
                                              setState(() {
                                                if (value != null)
                                                  image = value.path;
                                              });
                                            });
                                          },
                                          child: Container(
                                            width: 57,
                                            height: 57,
                                            decoration: BoxDecoration(
                                              color: Colors.white
                                                  .withOpacity(0.08),
                                              borderRadius:
                                                  BorderRadius.circular(17),
                                            ),
                                            child: image == ""
                                                ? goldenGradientWidget(
                                                    const Icon(
                                                    Icons.add,
                                                    size: 18,
                                                  ))
                                                : Image.file(File(image),
                                                    fit: BoxFit.cover),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        const Text(
                                          "Add Image",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Inter',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    editField(
                                      text: "Display Name:",
                                      color: Colors.white,
                                      controller: DisplayNameController,
                                      hintColor: Colors.white.withOpacity(0.30),
                                      hintText: "Enter Name",
                                      isEditable: true,
                                    ),
                                    const SizedBox(height: 5),
                                    selectGender(
                                        genderValue: gender,
                                        onChanged: (value) {
                                          setState(() {
                                            gender = value;
                                          });
                                        }),
                                    const SizedBox(height: 5),
                                    GestureDetector(
                                      onTap: () {
                                        showDatePicker(
                                                context: context,
                                                initialDate:
                                                    DateTime(2024, 2, 9),
                                                firstDate:
                                                    DateTime(1912, 2, 18),
                                                lastDate: DateTime(2024, 2, 9))
                                            .then((value) {
                                          setState(() {
                                            if (value != null) {
                                              BrithdayController.text =
                                                  "${value.day.toString().padLeft(2, '0')} ${value.month.toString().padLeft(2, '0')} ${value.year}";
                                              HoroscopeController.text =
                                                  horoscopeSign(value);
                                              ZodiacController.text =
                                                  zodiacSign(value);
                                            }
                                          });
                                        });
                                      },
                                      child: editField(
                                        text: "Birthday:",
                                        color: Colors.white,
                                        controller: BrithdayController,
                                        hintColor:
                                            Colors.white.withOpacity(0.30),
                                        hintText: "DD MM YYYY",
                                        isEditable: false,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    editField(
                                      text: "Horoscope:",
                                      color: Colors.white.withOpacity(0.30),
                                      controller: HoroscopeController,
                                      hintColor: Colors.white.withOpacity(0.30),
                                      hintText: "--",
                                      isEditable: false,
                                    ),
                                    const SizedBox(height: 5),
                                    editField(
                                      text: "Zodiac:",
                                      color: Colors.white.withOpacity(0.30),
                                      controller: ZodiacController,
                                      hintColor: Colors.white.withOpacity(0.30),
                                      hintText: "--",
                                      isEditable: false,
                                    ),
                                    const SizedBox(height: 5),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          HeightController.text = "";
                                        });
                                      },
                                      child: editField(
                                          text: "Height:",
                                          color: Colors.white,
                                          controller: HeightController,
                                          hintColor:
                                              Colors.white.withOpacity(0.19),
                                          hintText: "Add height",
                                          isEditable: true,
                                          keyboardType: TextInputType.number,
                                          onEditingComplete: () {
                                            HeightController.text =
                                                "${HeightController.text} cm";
                                          }),
                                    ),
                                    const SizedBox(height: 5),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          WeightController.text = "";
                                        });
                                      },
                                      child: editField(
                                          text: "Weight:",
                                          color: Colors.white,
                                          controller: WeightController,
                                          hintColor:
                                              Colors.white.withOpacity(0.19),
                                          hintText: "Add weight",
                                          isEditable: true,
                                          keyboardType: TextInputType.number,
                                          onEditingComplete: () {
                                            WeightController.text =
                                                "${WeightController.text} kg";
                                          }),
                                    ),
                                  ],
                                )
                              : Column(children: [
                                  Row(children: [
                                    Text("BirthDay: ",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.33),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Inter')),
                                    Flexible(
                                      child: Text(
                                          "${profileData.birthday.replaceAll(" ", "/")} (Age $age)",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Inter')),
                                    ),
                                  ]),
                                  const SizedBox(height: 5),
                                  Row(children: [
                                    Text("Horoscope: ",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.33),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Inter')),
                                    Text(horoscope,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Inter')),
                                  ]),
                                  const SizedBox(height: 5),
                                  Row(children: [
                                    Text("Zodiac: ",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.33),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Inter')),
                                    Text(zodiac,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Inter')),
                                  ]),
                                  const SizedBox(height: 5),
                                  Row(children: [
                                    Text("Height: ",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.33),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Inter')),
                                    Text("${profileData.height} cm",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Inter')),
                                  ]),
                                  const SizedBox(height: 5),
                                  Row(children: [
                                    Text("Weight: ",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.33),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Inter')),
                                    Text("${profileData.weight} kg",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Inter')),
                                  ]),
                                ]),
                    ])),
            Container(
                width: 359.0,
                height: profileData.interests.length == 0 ? 120.0 : null,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF0E191F),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Interests',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Inter',
                          ),
                        ),
                        IconButton(
                          icon: Image.asset('assets/edit-2.png'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/interests',
                                    arguments: profileData.interests)
                                .then(
                              (value) {
                                if (value != null) {
                                  _profileBloc.add(ProfileUpdate(
                                      widget.acessToken,
                                      ProfileData(
                                        name: profileData.name,
                                        username: profileData.username,
                                        email: profileData.email,
                                        birthday: profileData.birthday,
                                        height: profileData.height,
                                        weight: profileData.weight,
                                        interests: value as List<String>,
                                      )));
                                }
                              },
                            );
                          },
                        ),
                      ]),
                  const SizedBox(height: 15),
                  profileData.interests.length == 0
                      ? Flexible(
                          child: Text(
                            "Add in your interests to find a better match",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.52),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                            ),
                          ),
                        )
                      : Wrap(
                          spacing: 5,
                          runSpacing: 8,
                          children: profileData.interests.map((e) {
                            return Container(
                              height: 50,
                              width: (TextPainter(
                                          text: TextSpan(
                                            text: e,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Inter',
                                            ),
                                          ),
                                          maxLines: 1,
                                          textScaleFactor:
                                              MediaQuery.of(context)
                                                  .textScaleFactor,
                                          textDirection: TextDirection.ltr)
                                        ..layout())
                                      .size
                                      .width +
                                  20,
                              //alignment: Alignment.center,
                              padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(100),
                                  right: Radius.circular(100),
                                ),
                                color: Colors.white.withOpacity(0.06),
                              ),
                              child: Text(
                                e,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                ])),
          ]),
        ),
      )
    ]);
  }
}
