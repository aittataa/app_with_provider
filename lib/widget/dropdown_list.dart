import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_manager/constant/constant.dart';

class DropdownList extends StatelessWidget {
  final List<DropdownMenuItem> myList;
  final dynamic value;
  final String hint;
  final Function onChanged;
  const DropdownList({Key key, this.myList, this.value, this.hint, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: mainColor),
      ),
      child: DropdownButton(
        onChanged: onChanged,
        onTap: () => FocusScope.of(context).unfocus(),
        icon: const Icon(CupertinoIcons.chevron_down),
        iconEnabledColor: mainColor,
        isExpanded: true,
        dropdownColor: backColor,
        items: myList,
        value: value,
        underline: const SizedBox(),
        hint: Text(hint, style: const TextStyle(color: blackIconColor, fontWeight: FontWeight.w900)),
      ),
    );
  }
}
