import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'front_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => FrontPage();
}