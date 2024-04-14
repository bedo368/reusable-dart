import 'package:flutter_useable_widget_and_classes/core/res/fonts.dart';
import 'package:flutter_useable_widget_and_classes/src/on_boarding/domain/entities/page_content.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({required this.pageContent, super.key});
  final PageContent pageContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          pageContent.image,
          height: context.height * .4,
        ),
        SizedBox(
          height: context.height * .03,
        ),
        Padding(
          padding: const EdgeInsets.all(20).copyWith(bottom: 0),
          child: Column(
            children: [
              Text(
                pageContent.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: Fonts.aeonik,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: context.height * .02,
              ),
              Text(
                pageContent.content,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: context.height * .10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
