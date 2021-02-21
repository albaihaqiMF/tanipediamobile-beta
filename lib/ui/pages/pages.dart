import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanipedia_mobile_app/cubit/panen/get_list_panen_cubit.dart';
import 'package:tanipedia_mobile_app/cubit/profile/create_profile_cubit.dart';
import 'package:tanipedia_mobile_app/cubit/cubit.dart';
import 'package:tanipedia_mobile_app/cubit/pupuk/get_detail_pupuk_cubit.dart';
import 'package:tanipedia_mobile_app/cubit/pupuk/get_list_pupuk_cubit.dart';
import 'package:tanipedia_mobile_app/cubit/profile/profile_cubit.dart';
import 'package:tanipedia_mobile_app/cubit/profile/upload_photo_profile_cubit.dart';
import 'package:tanipedia_mobile_app/cubit/user/register_cubit.dart';
import 'package:tanipedia_mobile_app/local_storage/shared_preference.dart';
import 'package:tanipedia_mobile_app/model/dropdown/dropdowns.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/network/api_url.dart';
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
import 'dart:async';

part 'login_page.dart';
part 'auth_page.dart';
part 'home_page.dart';
part 'register_page.dart';
part 'create_profile_page.dart';
part 'profile_page.dart';
part 'list_pupuk_page.dart';
part 'detail_pupuk_page.dart';
part 'list_lahan_page.dart';
part 'detail_lahan_page.dart';
part 'create_lahan_page.dart';
part 'create_panen_page.dart';
part 'list_panen_page.dart';
part 'detail_panen_page.dart';
