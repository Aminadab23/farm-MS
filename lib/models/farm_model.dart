
import 'package:flutter/material.dart';


class FarmsListData {
  final String imageUrl;
  final String locationName;
  final String name;
  final String status;
  final Icon icon;
  final double area;
  FarmsListData({
    required this.imageUrl,
    required this.locationName,
    required this.name,
    required this.status,
    required this.icon,
    required this.area,
  });
}
