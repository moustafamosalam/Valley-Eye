import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

int stateNumber = 0;
int valleyNumber = 0;

List<String> statesList = <String> ['Sharjah', 'Ras-ElKhema', 'Al-Fujairah'];
const List<String> valleyTypeList = <String> ['Internal', 'External to Arabian Gulf Side', 'External Oman'];

List<Widget> currentAvailableTowers = [];

List<Widget> emptyState = [
  SizedBox(height: 400.h,),
  Center(
    child: Text('No Available Towers!',
      style: TextStyle(
          fontSize: 22.r,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontStyle: FontStyle.italic
      ),
    ),
  ),
];



// List<Widget> Internal_AlFujairah = [
//   RecipeCard(
//     title: 'AlHamriyah',
//     onlineStatus: true,
//     thumbnailUrl: 'https://drive.google.com/uc?export=view&id=1P6nNJu4BSqtHDyml0gUM5nI0zQVTaLV5',
//   ),
//   RecipeCard(
//     title: 'Khorfakkan',
//     onlineStatus: true,
//     thumbnailUrl: 'https://drive.google.com/uc?export=view&id=1PV7a3e-eu95yLxUmqZ5Fz2Bjf2zcllpq',
//   ),
//   RecipeCard(
//     title: 'AlDhaid',
//     onlineStatus: false,
//     thumbnailUrl: 'https://drive.google.com/uc?export=view&id=1YGFn_2LNcRHa1vWWEe80lW5KFe2QBpQa',
//   ),
//   RecipeCard(
//     title: 'Kalba',
//     onlineStatus: true,
//     thumbnailUrl: 'https://drive.google.com/uc?export=view&id=1yvQDSHjHmV5OCl3Oxh1BSNpF2DvN1oeu',
//   ),
//   RecipeCard(
//     title: 'Dibba Al-Hisn',
//     onlineStatus: false,
//     thumbnailUrl: 'https://drive.google.com/uc?export=view&id=16qKsCUoPpae1sGv6jUjthbk-VK1xsclY',
//   ),
// ];
// List<Widget> External_Araby_AlFujairah = [
//   RecipeCard(
//     title: 'Al-Ain',
//     onlineStatus: true,
//     thumbnailUrl: 'https://drive.google.com/uc?export=view&id=1mDkyF_H-6AAvpEMN4mEd0hOgGf_wB2B1',
//   ),
//   RecipeCard(
//     title: 'Bahia',
//     onlineStatus: false,
//     thumbnailUrl: 'https://drive.google.com/uc?export=view&id=15_7MU1TkipiaRBgOZpAicSdSSumRBiiI',
//   ),
//   RecipeCard(
//     title: 'Al-Khalifa',
//     onlineStatus: true,
//     thumbnailUrl: 'https://drive.google.com/uc?export=view&id=1ZWW6N1hH7dNHvcG1muZFYjGQVnSd_xWp',
//   ),
//   RecipeCard(
//     title: 'Al-Rahba',
//     onlineStatus: true,
//     thumbnailUrl: 'https://drive.google.com/uc?export=view&id=1UOH4ca3CqjSiQv8huWnBK8URStp5jh8m',
//   ),
//   RecipeCard(
//     title: 'Shahama',
//     onlineStatus: false,
//     thumbnailUrl: 'https://drive.google.com/uc?export=view&id=1zX3qM_q5g-bFO9EMtKJxFMw53NVUoP1d',
//   ),
// ];
// List<Widget> External_Oman_AlFujairah = [
//   RecipeCard(
//     title: 'Dubai',
//     onlineStatus: true,
//     thumbnailUrl: 'https://drive.google.com/uc?export=view&id=1efJ8oHd2_K4bHInPBFX4qpSlwi_Bbmur',
//   ),
//   RecipeCard(
//     title: 'Al-Wasl',
//     onlineStatus: false,
//     thumbnailUrl: 'https://drive.google.com/uc?export=view&id=1y51r_ylLJgJMA1kfrlI6Wa_hGiZej7XJ',
//   ),
//   RecipeCard(
//     title: 'Abu Hail',
//     onlineStatus: false,
//     thumbnailUrl: 'https://drive.google.com/uc?export=view&id=1c0NXlvu6pEO1UvQGrczKyE1DWOeOFrYK',
//   ),
//   RecipeCard(
//     title: 'Al-Karama',
//     onlineStatus: true,
//     thumbnailUrl: 'https://drive.google.com/uc?export=view&id=1FnC6U0bq4V2ibt9zBQRrOHKErSZOvkT6',
//   ),
//   RecipeCard(
//     title: 'Al-Nahda',
//     onlineStatus: true,
//     thumbnailUrl: 'https://drive.google.com/uc?export=view&id=1Y6k3AHw7xnW4W9a4nLvAcEZYyU2IK5zY',
//   ),
//
// ];