import 'dart:io';

import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:tanipedia_mobile_app/cubit/create_profile_cubit.dart';
import 'package:tanipedia_mobile_app/cubit/cubit.dart';
import 'package:tanipedia_mobile_app/cubit/profile_cubit.dart';
import 'package:tanipedia_mobile_app/cubit/user_cubit.dart';
import 'package:tanipedia_mobile_app/shared/shared.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tanipedia_mobile_app/services/services.dart';
import 'package:tanipedia_mobile_app/ui/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

part 'login_page.dart';
part 'auth_page.dart';
part 'home_page.dart';
part 'register_page.dart';
part 'create_profile_page.dart';
part 'profile_page.dart';
