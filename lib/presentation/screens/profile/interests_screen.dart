import 'package:flutter/material.dart';
import 'package:you_app_task/presentation/widget/blue_gradient_widget.dart';
import 'package:you_app_task/presentation/widget/golden_gradient_widget.dart';

class Interests extends StatefulWidget {
  final List<String> interests_list;

  Interests({required this.interests_list});

  @override
  _InterestsState createState() => _InterestsState();
}

class _InterestsState extends State<Interests> {
  TextEditingController _textEditingController = new TextEditingController();
  final List<String> interests = [];

  @override
  void initState() {
    super.initState();
    interests.addAll(widget.interests_list);
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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                    left: 18,
                    right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context, null);
                      },
                      child: Row(
                        children: [
                          Image.asset('assets/back.png', width: 7, height: 14),
                          const SizedBox(width: 10),
                          const Text(
                            'Back',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter'),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (interests.isNotEmpty)
                          Navigator.pop(context, interests);
                        else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                              'Please add at least one interest',
                              style: TextStyle(color: Colors.red),
                            ),
                            duration: Duration(seconds: 3),
                          ));
                        }
                      },
                      child: blueGradientWidget(
                        const Text(
                          'save',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: goldenGradientWidget(
                  const Text(
                    'Tell everyone about yourself',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter'),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 35),
                child: Text(
                  'What interest you?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter'),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: TextField(
                  controller: _textEditingController,
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter'),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFD9D9D9).withOpacity(0.06),
                  ),
                  onEditingComplete: () {
                    setState(() {
                      if (_textEditingController.text.isNotEmpty &&
                          !interests.contains(_textEditingController.text))
                        interests.add(_textEditingController.text);
                      _textEditingController.clear();
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Container(
                      width: 359,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0xFFD9D9D9).withOpacity(0.06),
                      ),
                      child: Wrap(
                        spacing: 5.0,
                        runSpacing: 8.0,
                        children: interests
                            .map(
                              (interest) => Container(
                                height: 31,
                                width: (TextPainter(
                                            text: TextSpan(
                                              text: interest,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Inter'),
                                            ),
                                            maxLines: 1,
                                            textScaleFactor:
                                                MediaQuery.of(context)
                                                    .textScaleFactor,
                                            textDirection: TextDirection.ltr)
                                          ..layout())
                                        .size
                                        .width +
                                    32,
                                padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white.withOpacity(0.10),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      interest,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Inter'),
                                    ),
                                    const SizedBox(width: 5),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          interests.remove(interest);
                                        });
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 10.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ))),
            ]),
      ),
    );
  }
}
