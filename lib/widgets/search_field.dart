import 'package:flutter/material.dart';

class SearchFieldInput extends StatelessWidget {
  const SearchFieldInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 234, 234, 234),
          filled: true,
          border: InputBorder.none,
          hintText: "Search or phone number",
          prefixIcon: Icon(Icons.search, color: Colors.grey),
        ),
      ),
    );
  }
}
