import 'package:flutter/material.dart';

class Course {
  final String title, description, iconSrc;
  final Color bgColor;

  Course({
    required this.title,
    this.description = "Contrua e anime um app iOS do zero",
    this.iconSrc = "assets/icons/ios.svg",
    this.bgColor = const Color(0xFF7553F6),
  });
}

List<Course> courses = [
  Course(title: "Animações em SwiftUI"),
  Course(
    title: "Animações em Flutter",
    iconSrc: "assets/icons/code.svg",
    bgColor: const Color(0xFF80A4FF),
  ),
];

List<Course> recentCourses = [
  Course(title: "State Machine"),
  Course(
    title: "Menu Animado",
    iconSrc: "assets/icons/code.svg",
    bgColor: const Color(0xFF9CC5FF),
  ),
  Course(title: "Flutter e Rive"),
  Course(
    title: "Menu Animado",
    iconSrc: "assets/icons/code.svg",
    bgColor: const Color(0xFF9CC5FF),
  ),
];
