import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanipedia_mobile_app/cubit/profile_cubit.dart';
import 'package:tanipedia_mobile_app/shared/shared.dart';
import 'package:tanipedia_mobile_app/ui/pages/pages.dart';
import 'package:tanipedia_mobile_app/ui/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButton(
          onPress: () {
            context.bloc<ProfileCubit>().getProfile(77);
            Get.to(ProfilePage());
          },
          text: 'Get Profile',
          color: mainColor),
    );
  }
}
