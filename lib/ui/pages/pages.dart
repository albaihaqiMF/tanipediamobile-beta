import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_select/smart_select.dart';
import 'package:tanipedia_mobile_app/cubit/panen/get_list_panen_cubit.dart';
import 'package:tanipedia_mobile_app/cubit/profile/create_profile_cubit.dart';
import 'package:tanipedia_mobile_app/cubit/cubit.dart';
import 'package:tanipedia_mobile_app/cubit/pupuk/get_detail_pupuk_cubit.dart';
import 'package:tanipedia_mobile_app/cubit/pupuk/get_list_pupuk_cubit.dart';
import 'package:tanipedia_mobile_app/cubit/profile/profile_cubit.dart';
import 'package:tanipedia_mobile_app/cubit/profile/upload_photo_profile_cubit.dart';
import 'package:tanipedia_mobile_app/cubit/user/register_cubit.dart';
import 'package:tanipedia_mobile_app/local_storage/shared_preference.dart';
import 'package:tanipedia_mobile_app/model/dropdown_data/data.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/network/api_url.dart';
import 'package:tanipedia_mobile_app/routes/app_routes.dart';
import 'package:tanipedia_mobile_app/shared/shared.dart';
import 'package:supercharged/supercharged.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tanipedia_mobile_app/services/services.dart';
import 'package:tanipedia_mobile_app/ui/pages/test.dart';
import 'package:tanipedia_mobile_app/ui/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:async';

// Initial
part 'main_page.dart';

// General
part 'home_page.dart';
part 'dashboard_page.dart';

// Auth
part 'auth/login_page.dart';
part 'auth/auth_page.dart';
part 'auth/splash_page.dart';

// Register
part 'register/register_page.dart';
part 'register/create_profile_page1.dart';
part 'register/create_profile_page2.dart';
part 'register/create_profile_page3.dart';

// Profile
part 'profile/profile_page.dart';
part 'profile/biodata_page.dart';
part 'profile/address_page.dart';
part 'profile/help_page.dart';
part 'profile/interest_page.dart';
part 'profile/profile_pertanian.dart';

// Pupuk
part 'pupuk/list_pupuk_page.dart';
part 'pupuk/detail_pupuk_page.dart';

// Lahan
part 'lahan/list_lahan_page.dart';
part 'lahan/detail_lahan_page.dart';
part 'lahan/create_lahan_page.dart';

// Panen
part 'panen/create_panen_page.dart';
part 'panen/list_panen_page.dart';
part 'panen/detail_panen_page.dart';
