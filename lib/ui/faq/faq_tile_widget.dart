import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';

class FAQTile extends StatelessWidget {
  const FAQTile({
    Key? key,
    required this.index,
    required this.title,
    required this.content,
  }) : super(key: key);
  final String index;
  final String title;
  final String content;

  Widget _buildFaqRow({
    required IconData icon,
    required String text,
    required bool isQuestion,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: AppColor.cRed,
          size: 24,
        ),
        const SizedBox(width: 13),
        Expanded(
          child: Text(
            text,
            style: (isQuestion)
                ? AppText.textNormal.copyWith(
                    fontWeight: AppText.semiBold,
                  )
                : AppText.textNormal,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: AppShadow.medium,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildFaqRow(
                icon: Icons.help,
                text: title,
                isQuestion: true,
              ),
              const SizedBox(height: 18),
              _buildFaqRow(
                icon: Icons.question_answer,
                text: content,
                isQuestion: false,
              ),
            ],
          ),
        ),
        Positioned(
          top: -10,
          left: -10,
          child: Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: AppColor.cRed,
              borderRadius: BorderRadius.circular(20),
              boxShadow: AppShadow.medium,
            ),
            child: Center(
              child: Text(
                index,
                style: AppText.textSmall.copyWith(
                  color: AppColor.white,
                  fontWeight: AppText.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
