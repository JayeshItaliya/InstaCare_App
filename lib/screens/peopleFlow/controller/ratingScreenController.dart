import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingScreenController extends GetxController {
  List<String> comments = [
    "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
    "Donec porta tempor sapien nec sagittis. Integer fermentum interdum interdum. Suspendisse dapibus sem vulputate, convallis leo at, consectetur purus. Cras lectus tortor, iaculis quis mollis vel, commodo at odio.",
    "Fusce eget mattis nulla. Nunc ligula sem, ornare sed feugiat sit amet, consectetur eget urna. Praesent non fermentum quam, sed tincidunt orci. Ut enim arcu, pellentesque eu quam in, sollicitudin ultrices tellus. Integer at efficitur arcu. Duis eleifend, leo sit amet dictum tincidunt, felis ipsum suscipit nisl, in laoreet nibh elit eu tortor. In pretium felis dolor..."
  ].obs;

  List<String> names =
      ['~ Center Care ', '~ Center Care ', '~ Elevate Care North Branch'].obs;
}
