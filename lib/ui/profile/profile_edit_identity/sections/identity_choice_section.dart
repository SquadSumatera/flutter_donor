import 'package:flutter/material.dart';
import '../../../../shared/theme.dart';
import '../widgets/identity_choice_item.dart';

class IdentityChoiceSection extends StatefulWidget {
  const IdentityChoiceSection({
    Key? key,
    required this.title,
    required this.onChanged,
    required this.groupValue,
    required this.choices,
  }) : super(key: key);

  final String title;
  final Function onChanged;
  final dynamic groupValue;
  final Map<String, dynamic> choices;

  @override
  State<IdentityChoiceSection> createState() => _IdentityChoiceSectionState();
}

class _IdentityChoiceSectionState extends State<IdentityChoiceSection> {
  List<Widget> _buildChoices() {
    return widget.choices.keys.map((String choice) {
      return GestureDetector(
        onTap: () => widget.onChanged(widget.choices[choice]),
        child: IdentityChoiceItem(
          label: choice,
          active: (widget.groupValue == widget.choices[choice]),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.title,
          style: AppText.textNormal.copyWith(
            color: AppColor.white,
            fontWeight: AppText.bold,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          runSpacing: 10,
          children: _buildChoices(),
        ),
      ],
    );
  }
}