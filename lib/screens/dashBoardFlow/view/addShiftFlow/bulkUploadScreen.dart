import 'package:flutter/material.dart';
import 'package:instacare/Utils/appStyle.dart';

class BulkUploadScreen extends StatefulWidget {
  const BulkUploadScreen({Key? key}) : super(key: key);

  @override
  State<BulkUploadScreen> createState() => _BulkUploadScreenState();
}

class _BulkUploadScreenState extends State<BulkUploadScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding,
    );
  }
}
